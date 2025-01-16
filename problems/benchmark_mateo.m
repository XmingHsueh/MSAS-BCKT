function problem = benchmark_mateo(idx)

problem = struct;

switch (idx)

    case 1 % HS-1, (1,2)-(3,4,5)

        load('mateo-data\hs1.mat');
        dim = 15;
        problem.dim = dim;
        problem.T = 5;
        
        problem.Lb{1} = -100*ones(1,dim);
        problem.Ub{1} = 100*ones(1,dim);
        problem.Fnc{1} = @(x)Sphere(x,eye(dim),shift1,0);

        problem.Lb{2} = -10*ones(1,dim);
        problem.Ub{2} = 10*ones(1,dim);
        problem.Fnc{2} = @(x)Rastrigin(x,eye(dim),shift2,0);

        problem.Lb{3} = -32*ones(1,dim);
        problem.Ub{3} = 32*ones(1,dim);
        problem.Fnc{3} = @(x)Ackley(x,eye(dim),shift3,0);

        problem.Lb{4} = -50*ones(1,dim);
        problem.Ub{4} = 50*ones(1,dim);
        problem.Fnc{4} = @(x)Elliptic(x,eye(dim),shift4,0);

        problem.Lb{5} = -200*ones(1,dim);
        problem.Ub{5} = 200*ones(1,dim);
        problem.Fnc{5} = @(x)Griewank(x,eye(dim),shift5,0);

    case 2 % HS-2, (1,2)-(3)-(4,5)
        
        load('mateo-data\hs2.mat');
        dim = 20;
        problem.dim = dim;
        problem.T = 5;

        problem.Lb{1} = -32*ones(1,dim);
        problem.Ub{1} = 32*ones(1,dim);
        problem.Fnc{1} = @(x)Ackley(x,eye(dim),shift1,0);

        problem.Lb{2} = -100*ones(1,dim);
        problem.Ub{2} = 100*ones(1,dim);
        problem.Fnc{2} = @(x)Sphere(x,eye(dim),shift2,0);

        problem.Lb{3} = -50*ones(1,dim);
        problem.Ub{3} = 50*ones(1,dim);
        problem.Fnc{3} = @(x)Rosenbrock(x,eye(dim),shift3,0);

        problem.Lb{4} = -0.5*ones(1,dim);
        problem.Ub{4} = 0.5*ones(1,dim);
        problem.Fnc{4} = @(x)Weierstrass(x,eye(dim),shift4,0);

        problem.Lb{5} = -200*ones(1,dim);
        problem.Ub{5} = 200*ones(1,dim);
        problem.Fnc{5} = @(x)Griewank(x,eye(dim),shift5,0);

    case 3 % MS-1, (1,2)-(3,4)-(5)
        
        load('mateo-data\ms1.mat');
        dim = 10;
        problem.dim = dim;
        problem.T = 5;
        
        problem.Lb{1} = -100*ones(1,dim);
        problem.Ub{1} = 100*ones(1,dim);
        problem.Fnc{1} = @(x)Sphere(x,eye(dim),shift1,0);

        problem.Lb{2} = -10*ones(1,dim);
        problem.Ub{2} = 10*ones(1,dim);
        problem.Fnc{2} = @(x)Rastrigin(x,eye(dim),shift2,0);

        problem.Lb{3} = -50*ones(1,dim);
        problem.Ub{3} = 50*ones(1,dim);
        problem.Fnc{3} = @(x)Elliptic(x,eye(dim),shift3,0);

        problem.Lb{4} = -0.5*ones(1,dim);
        problem.Ub{4} = 0.5*ones(1,dim);
        problem.Fnc{4} = @(x)Weierstrass(x,eye(dim),shift4,0);

        problem.Lb{5} = -10*ones(1,dim);
        problem.Ub{5} = 10*ones(1,dim);
        problem.Fnc{5} = @(x)Schwefel22(x,shift5);
        
    case 4 % MS-2, (1)-(2,5)-(3,4)
        
        load('mateo-data\ms2.mat');
        dim = 15;
        problem.dim = dim;
        problem.T = 5;
        
        problem.Lb{1} = -30*ones(1,dim);
        problem.Ub{1} = 30*ones(1,dim);
        problem.Fnc{1} = @(x)Levy(x,shift1);

        problem.Lb{2} = -32*ones(1,dim);
        problem.Ub{2} = 32*ones(1,dim);
        problem.Fnc{2} = @(x)Ackley(x,eye(dim),shift2,0);

        problem.Lb{3} = -100*ones(1,dim);
        problem.Ub{3} = 100*ones(1,dim);
        problem.Fnc{3} = @(x)Sphere(x,eye(dim),shift3,0);

        problem.Lb{4} = -10*ones(1,dim);
        problem.Ub{4} = 10*ones(1,dim);
        problem.Fnc{4} = @(x)Rastrigin(x,eye(dim),shift4,0);

        problem.Lb{5} = -200*ones(1,dim);
        problem.Ub{5} = 200*ones(1,dim);
        problem.Fnc{5} = @(x)Griewank(x,eye(dim),shift5,0);

    case 5 % LS-1, (1)-(2)-(3)-(4)-(5)

        load('mateo-data\ls1.mat');
        dim = 20;
        problem.dim = dim;
        problem.T = 5;
        
        problem.Lb{1} = -10*ones(1,dim);
        problem.Ub{1} = 10*ones(1,dim);
        problem.Fnc{1} = @(x)Schwefel22(x,shift1);

        problem.Lb{2} = -30*ones(1,dim);
        problem.Ub{2} = 30*ones(1,dim);
        problem.Fnc{2} = @(x)Levy(x,shift2);

        problem.Lb{3} = -5*ones(1,dim);
        problem.Ub{3} = 5*ones(1,dim);
        problem.Fnc{3} = @(x)Quartic(x,shift3);

        problem.Lb{4} = -10*ones(1,dim);
        problem.Ub{4} = 10*ones(1,dim);
        problem.Fnc{4} = @(x)Rastrigin(x,eye(dim),shift4,0);

        problem.Lb{5} = -32*ones(1,dim);
        problem.Ub{5} = 32*ones(1,dim);
        problem.Fnc{5} = @(x)Ackley(x,eye(dim),shift5,0);
        
    case 6 % LS-2, (1)-(2)-(3)-(4)-(5)

        load('mateo-data\ls2.mat');
        dim = 10;
        problem.dim = dim;
        problem.T = 5;
        
        problem.Lb{1} = -100*ones(1,dim);
        problem.Ub{1} = 100*ones(1,dim);
        problem.Fnc{1} = @(x)Sphere(x,eye(dim),shift1,0);

        problem.Lb{2} = -10*ones(1,dim);
        problem.Ub{2} = 10*ones(1,dim);
        problem.Fnc{2} = @(x)Schwefel22(x,shift2);

        problem.Lb{3} = -0.5*ones(1,dim);
        problem.Ub{3} = 0.5*ones(1,dim);
        problem.Fnc{3} = @(x)Weierstrass(x,eye(dim),shift3,0);

        problem.Lb{4} = -200*ones(1,dim);
        problem.Ub{4} = 200*ones(1,dim);
        problem.Fnc{4} = @(x)Griewank(x,eye(dim),shift4,0);

        problem.Lb{5} = -50*ones(1,dim);
        problem.Ub{5} = 50*ones(1,dim);
        problem.Fnc{5} = @(x)Elliptic(x,eye(dim),shift5,0);


end

end