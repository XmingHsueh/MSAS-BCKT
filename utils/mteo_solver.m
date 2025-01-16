function [database,objs_best,actions] = mteo_solver(problem,FEsMax,name_sas,paras,r,p)

%**********************************************************************%
%************************Phase 1: Initialization************************%
%**********************************************************************%
if isempty(name_sas)
    name_sas = 'BO-LCB';
end
no_tasks = problem.T; % number of tasks
gen_gap = no_tasks*paras.gen_gap;
no_initials = size(paras.warm_up,1);
solutions_initial = paras.warm_up;
objs_initial = cell(no_tasks,1);
database = cell(no_tasks,1);
objs_best = cell(no_tasks,1);
for t = 1:no_tasks
    for i = 1:no_initials
        objs_initial{t} = problem.Fnc{t}(repmat(problem.Lb{t},no_initials,1)+...
            (repmat(problem.Ub{t},no_initials,1)-repmat(problem.Lb{t},no_initials,1)).*solutions_initial);
    end
    database{t} = [solutions_initial,objs_initial{t}];
    objs_best{t} = sort(objs_initial{t},'descend');
end
FEsUsed = no_initials*no_tasks;
if strcmp(name_sas,'AutoSAEA')
    options_mtsas=cell(no_tasks,1);
    for t = 1:no_tasks
        options_mtsas{t} = struct('rbf_model',[],'gp_model',[],'knn_model',[],'prs_model',[],...
            'save_rp',[],'save_rl',[],'save_gl',[],'save_ge',[],'save_pp',[],'save_pl',[],'save_ki',[],'save_ko',[]);
        options_mtsas{t}.func_exp = @(x)problem.Fnc{t}(problem.Lb{t}+(problem.Ub{t}-problem.Lb{t}).*x);
    end
else
    options_mtsas=cell(no_tasks,1);
end
MUs = nan(no_tasks,no_tasks);
SIGMA2s = nan(no_tasks,no_tasks);
actions = cell(no_tasks,1);
for t = 1:no_tasks
    actions{t} = [];
end

%**********************************************************************%
%***********Phase 2: Multi-Task Expensive Optimization**************%
%**********************************************************************%
solutions_in = cell(no_tasks,1); % internal solutions
improvements_in = cell(no_tasks,1); % internal improvements
solutions_candidate = cell(no_tasks,1); % candidate solutions to be evaluated

while FEsUsed < FEsMax

    % execute one single acquisition with the designated SAS engine
    for t = 1:no_tasks
        [solutions_in{t},improvements_in{t},options_mtsas{t}] = acquisition_single(database{t},...
            zeros(1,problem.dim),ones(1,problem.dim),name_sas,options_mtsas{t});
    end

    % Bayesian competitive knowledge transfer
    for t = 1:no_tasks
        if mod(FEsUsed,gen_gap)==0
            [solution_ex,improvement_ex,impn,idxs,MUs,SIGMA2s,MUs_old,SIGMA2s_old] = knowledge_competition(database,MUs,SIGMA2s,t);
            if improvements_in{t} >= improvement_ex
                solutions_candidate{t} = solutions_in{t};
                actions{t} = [actions{t};0];
                MUs(idxs,t) = MUs_old(idxs,t);
                SIGMA2s(idxs,t) = SIGMA2s_old(idxs,t);
            else
                solutions_candidate{t} = solution_ex;
                imp_actual = (min(database{t}(:,end))-problem.Fnc{t}(problem.Lb{t}+...
                    (problem.Ub{t}-problem.Lb{t}).*solutions_candidate{t}))/max(database{t}(:,end)); % no need to update the count of FEs as this candidate solution will be evaluated later
                mu_transfer = imp_actual/impn;
                actions{t} = [actions{t};idxs];
                sigma2_transfer = 0.05^2*exp(-(FEsUsed-no_initials*no_tasks)/gen_gap);
                MUs(idxs,t) = (MUs(idxs,t)*sigma2_transfer+mu_transfer*SIGMA2s(idxs,t))/(sigma2_transfer+SIGMA2s(idxs,t));
                SIGMA2s(idxs,t) = SIGMA2s(idxs,t)*sigma2_transfer/(SIGMA2s(idxs,t)+sigma2_transfer);
            end
        else
            solutions_candidate{t} = solutions_in{t};
        end
    end
    

    % evaluate the candidate solution and update the database
    epsilon = 5e-3;
    no_trials  = 50;
    scales = linspace(0.1,1,no_trials);
    c = 1;
    for t = 1:no_tasks
        while min(max(abs(repmat(solutions_candidate{t},size(database{t},1),1)-...
            database{t}(:,1:end-1)),[],2)) < epsilon
            perturbation = scales((mod(c,no_trials)==0)*no_trials+(mod(c,no_trials)~=0)*...
            mod(c,no_trials)).*(rand(1,problem.dim)-0.5*ones(1,problem.dim));
            solutions_candidate{t} = solutions_candidate{t} + perturbation;
            solutions_candidate{t}(solutions_candidate{t}>1) = 1;
            solutions_candidate{t}(solutions_candidate{t}<0) = 0;
            c = c+1;
        end
        obj_candidate = problem.Fnc{t}(problem.Lb{t}+(problem.Ub{t}-problem.Lb{t}).*solutions_candidate{t});
        database{t} = [database{t};solutions_candidate{t},obj_candidate];
        objs_best{t} = [objs_best{t}; (obj_candidate<=objs_best{t}(end))*obj_candidate+...
        (obj_candidate>objs_best{t}(end))*objs_best{t}(end)];
    end

    FEsUsed = FEsUsed + no_tasks;

    if gen_gap > FEsMax
        fprintf([name_sas,'-FEsUsed: %d, '],FEsUsed);
    else
        fprintf([name_sas,'-CKT-FEsUsed: %d, '],FEsUsed);
    end
    for t = 1:no_tasks
        fprintf('T-%d: %.2f, ',t,objs_best{t}(end));
    end
    fprintf('(%d-th run, %d-th problem)\n',r,p);
    
end

end