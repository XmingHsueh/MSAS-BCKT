function Obj = Quartic(var,opt)
%Quartic function with noise
%   - var: design variable vector
%   - opt: shift vector
    [ps, D] = size(var);
    w = 1:length(opt);
    var = var-repmat(opt,ps,1);
    Obj = sum(repmat(w,ps,1).*var.^4,2)+rand;
end