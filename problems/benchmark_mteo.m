function problem = benchmark_mteo(idx)

problem = struct;

switch (idx)

    case 1 % HS-1

        load('mteo-data\hs1.mat');
        dim = 10;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -32*ones(1,dim);
        problem.Ub{1} = 32*ones(1,dim);
        problem.Fnc{1} = @(x)Ackley(x,eye(dim),shift1,0);

        problem.Lb{2} = -200*ones(1,dim);
        problem.Ub{2} = 200*ones(1,dim);
        problem.Fnc{2} = @(x)Griewank(x,eye(dim),shift2,0);


    case 2 % HS-2
        
        load('mteo-data\hs2.mat');
        dim = 15;
        problem.dim = dim;
        problem.T = 2;

        problem.Lb{1} = -100*ones(1,dim);
        problem.Ub{1} = 100*ones(1,dim);
        problem.Fnc{1} = @(x)Sphere(x,eye(dim),shift1,0);

        problem.Lb{2} = -10*ones(1,dim);
        problem.Ub{2} = 10*ones(1,dim);
        problem.Fnc{2} = @(x)Rastrigin(x,eye(dim),shift2,0);

    case 3 % HS-3
        
        load('mteo-data\hs3.mat');
        dim = 20;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -50*ones(1,dim);
        problem.Ub{1} = 50*ones(1,dim);
        problem.Fnc{1} = @(x)Elliptic(x,eye(dim),shift1,0);

        problem.Lb{2} = -50*ones(1,dim);
        problem.Ub{2} = 50*ones(1,dim);
        problem.Fnc{2} = @(x)Rosenbrock(x,eye(dim),shift2,0);
        
    case 4 % MS-1
        
        load('mteo-data\ms1.mat');
        dim = 20;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -200*ones(1,dim);
        problem.Ub{1} = 200*ones(1,dim);
        problem.Fnc{1} = @(x)Griewank(x,eye(dim),shift1,0);

        problem.Lb{2} = -0.5*ones(1,dim);
        problem.Ub{2} = 0.5*ones(1,dim);
        problem.Fnc{2} = @(x)Weierstrass(x,eye(dim),shift2,0);

    case 5 % MS-2

        load('mteo-data\ms2.mat');
        dim = 10;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -10*ones(1,dim);
        problem.Ub{1} = 10*ones(1,dim);
        problem.Fnc{1} = @(x)Schwefel22(x,shift1);

        problem.Lb{2} = -30*ones(1,dim);
        problem.Ub{2} = 30*ones(1,dim);
        problem.Fnc{2} = @(x)Levy(x,shift2);
        
    case 6 % MS-3

        load('mteo-data\ms3.mat');
        dim = 20;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -32*ones(1,dim);
        problem.Ub{1} = 32*ones(1,dim);
        problem.Fnc{1} = @(x)Ackley(x,eye(dim),shift1,0);

        problem.Lb{2} = -100*ones(1,dim);
        problem.Ub{2} = 100*ones(1,dim);
        problem.Fnc{2} = @(x)Sphere(x,eye(dim),shift2,0);

    case 7 % LS-1
        
        load('mteo-data\ls1.mat');
        dim = 15;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -50*ones(1,dim);
        problem.Ub{1} = 50*ones(1,dim);
        problem.Fnc{1} = @(x)Sphere(x,eye(dim),shift1,0);

        problem.Lb{2} = -10*ones(1,dim);
        problem.Ub{2} = 10*ones(1,dim);
        problem.Fnc{2} = @(x)Rastrigin(x,eye(dim),shift2,0);

    case 8 % LS-2
        
        load('mteo-data\ls2.mat');
        dim = 20;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -5*ones(1,dim);
        problem.Ub{1} = 5*ones(1,dim);
        problem.Fnc{1} = @(x)Quartic(x,shift1);

        problem.Lb{2} = -30*ones(1,dim);
        problem.Ub{2} = 30*ones(1,dim);
        problem.Fnc{2} = @(x)Levy(x,shift2);

    case 9 % LS-3
        
        load('mteo-data\ls3.mat');
        dim = 10;
        problem.dim = dim;
        problem.T = 2;
        
        problem.Lb{1} = -32*ones(1,dim);
        problem.Ub{1} = 32*ones(1,dim);
        problem.Fnc{1} = @(x)Ackley(x,eye(dim),shift1,0);

        problem.Lb{2} = -200*ones(1,dim);
        problem.Ub{2} = 200*ones(1,dim);
        problem.Fnc{2} = @(x)Griewank(x,eye(dim),shift2,0);

end

end