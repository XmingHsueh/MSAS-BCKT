function [f,df] = trust_region_surrogate(X,y,x)
dim = size(X,2);
no_samples = length(y);
R = zeros(no_samples,no_samples);
for i=1:no_samples
    for j=1:no_samples
        R(i,j)=sqrt(sum((X(i,:)-X(j,:)).^2));
    end
end
spr_estimate = max(max(R))/(dim*no_samples)^(1/dim);
net = newrbe(X',y',spr_estimate);
f = sim(net,x');
delta = 1e-3;
df = zeros(1,dim);
for i = 1:dim
    x_eva = x;
    x_eva(i) = x_eva(i)+delta;
    fd = sim(net,x_eva');
    df(i) = (fd-f)/delta;
end