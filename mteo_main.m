clc,clear
warning off;

FEsMax = 400; % maximum number of function evaluations, 200×2
optimizer_list = {'BO-LCB','TLRBF','GL-SADE','DDEA-MESS','LSADE','AutoSAEA'}; % backbone optimizers: {'BO-LCB','TLRBF','GL-SADE','DDEA-MESS','LSADE','AutoSAEA'}
runs = 30; % number of independent runs
num_initial_solutions = 50;
no_problems = 9; % number of MTOPs

for p = 1:no_problems
    for o = 1:length(optimizer_list)
        results = struct;
        problem = benchmark_mteo(p);
        dim = problem.dim;
        for r = 1:runs
            options.warm_up = lhsdesign_modified(num_initial_solutions,zeros(1,dim),ones(1,dim));
            options.gen_gap = 10;
            [~,results(r).ckt,results(r).actions] = mteo_solver(problem,FEsMax,optimizer_list{o},options,r,p);
        end
        filename = ['.\results-mteo\',optimizer_list{o},'\problem',num2str(p),'.mat'];
        save(filename,'results');
    end
end