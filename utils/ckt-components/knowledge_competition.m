function [solution_ex,imp_max,impn,idxs,MUs,SIGMA2s,MUs_old,SIGMA2s_old] = knowledge_competition(database,MUs,SIGMA2s,idxt)

no_tasks = length(database); % the number of component tasks
dim = size(database{idxt},2)-1; % the target dimension
Xt = database{idxt}(:,1:end-1); % the target solutions
Yt = database{idxt}(:,end); % the objective values of the target solutions
solutions_external = zeros(no_tasks,dim); % externel solutions for the target task
improvements = -1*inf(no_tasks,1); % externel improvements
impns = -1*inf(no_tasks,1);
similarities = zeros(no_tasks,1); % source-target similarities
sigma2_sim = 0.05^2;

% build surrogate models for the component tasks
surrogates = struct;
n_count = 0;
while n_count < no_tasks
    t = n_count + 1;
    try % the construction of GP may fail occasionally in a few releases
        surrogates(t).func = surrogate_model(database{t},'gpr');
        n_count = n_count+1;
    catch
        continue;
    end
end

for t = 1:no_tasks
    if t ~= idxt
        Xs = database{t}(:,1:end-1);
        Ys = database{t}(:,end);
        [similarities(t),Yval] = similarity_quantification(Xs,Ys,surrogates(t).func,Xt,Yt,surrogates(idxt).func,'SSRC');
        if isnan(MUs(t,idxt))
            MUs(t,idxt) = similarities(t);
            SIGMA2s(t,idxt) = sigma2_sim;
            MUs_old(t,idxt) = MUs(t,idxt);
            SIGMA2s_old(t,idxt) = SIGMA2s(t,idxt);
        else
            MUs_old(t,idxt) = MUs(t,idxt);
            SIGMA2s_old(t,idxt) = SIGMA2s(t,idxt);
            MUs(t,idxt) = (MUs(t,idxt)*sigma2_sim+similarities(t)*SIGMA2s(t,idxt))/(sigma2_sim+SIGMA2s(t,idxt));
            SIGMA2s(t,idxt) = SIGMA2s(t,idxt)*sigma2_sim/(SIGMA2s(t,idxt)+sigma2_sim);
        end
        transferability = normrnd(MUs(t,idxt),sqrt(SIGMA2s(t,idxt)));
        [improvements(t),impns(t)] = improvement_external(Ys,Yval,Yt,transferability);
        [~,idx] = min(Ys);
        solutions_external(t,:) = Xs(idx,:);
    else
        solutions_external(t,:) = ones(1,dim);
    end
end
[imp_max,idx] = max(improvements);
solution_ex = solutions_external(idx,:);
impn = impns(idx);
idxs = idx;