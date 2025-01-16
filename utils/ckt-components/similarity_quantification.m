function [sim,objs_val] = similarity_quantification(Xs,Ys,funcs,Xt,Yt,funct,method)

switch(method)
    case 'SSRC' % Spearman rank correlation
        ranks_target = zeros(length(Yt),1);
        for i = 1:length(Yt)
            ranks_target(i) = sum(Yt<Yt(i))+1;
        end
        objs_val = zeros(length(Yt),1);
        for i = 1:length(Yt)
            objs_val(i) = funcs(Xt(i,:));
        end
        ranks_val = zeros(length(Yt),1);
        for i = 1:length(Yt)
            ranks_val(i) = sum(objs_val<objs_val(i))+1;
        end
        sim = mySpearman(ranks_target,ranks_val);
end

