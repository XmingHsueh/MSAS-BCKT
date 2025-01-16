function Obj = Schwefel22(var,opt)
%Schwefel 2.2 function
%   - var: design variable vector
%   - opt: shift vector
    [ps, D] = size(var);

    var = var-repmat(opt,ps,1);
    Obj = sum(abs(var),2)+prod(abs(var),2);
end