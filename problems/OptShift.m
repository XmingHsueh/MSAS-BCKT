clc,clear


% %%%%%%%%%%%%%HS Problems%%%%%%%%%%%%%%
% 
% Task 1
dim = 10;
lb1 = -32;ub1 = 32;
lb2 = -200;ub2 = 200;
shift = rand(1,dim);
shift1 = lb1+(ub1-lb1).*shift;
shift2 = lb2+(ub2-lb2).*shift;
save hs1 shift1 shift2
% 
% % Task 2
% dim = 15;
% lb1 = -100;ub1 = 100;
% lb2 = -10;ub2 = 10;
% shift = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift;
% shift2 = lb2+(ub2-lb2).*shift;
% save hs2 shift1 shift2
% 
% Task 3
dim = 20;
lb1 = -50;ub1 = 50;
lb2 = -50;ub2 = 50;
shift = rand(1,dim);
shift1 = lb1+(ub1-lb1).*shift;
shift2 = lb2+(ub2-lb2).*shift;
save hs3 shift1 shift2
% 
% 
% 
% 
% %%%%%%%%%%%%%%MS Problems%%%%%%%%%%%%%%
% 
ms_scale = 0.2;
% % 
% % Task 4
% dim = 20;
% lb1 = -200;ub1 = 200;
% lb2 = -0.5;ub2 = 0.5;
% shift = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift;
% shift_ms = shift+ms_scale*(rand(1,dim)-0.5)*2;
% shift_ms(shift_ms<0) = 0;
% shift_ms(shift_ms>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_ms;
% save ms1 shift1 shift2

% Task 5
% dim = 10;
% lb1 = -10;ub1 = 10;
% lb2 = -30;ub2 = 30;
% shift = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift;
% shift_ms = shift+ms_scale*(rand(1,dim)-0.5)*2;
% shift_ms(shift_ms<0) = 0;
% shift_ms(shift_ms>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_ms;
% save ms2 shift1 shift2

% % Task 6
% dim = 20;
% lb1 = -32;ub1 = 32;
% lb2 = -100;ub2 = 100;
% shift = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift;
% shift_ms = shift+ms_scale*(rand(1,dim)-0.5)*2;
% shift_ms(shift_ms<0) = 0;
% shift_ms(shift_ms>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_ms;
% save ms3 shift1 shift2
% 
% 
% 
% %%%%%%%%%%%%%%LS Problems%%%%%%%%%%%%%%
% 
ls_scale = 0.6;
% % Task 7
% dim = 15;
% lb1 = -50;ub1 = 50;
% lb2 = -10;ub2 = 10;
% shift = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift;
% shift_ms = shift+ls_scale*(rand(1,dim)-0.5)*2;
% shift_ms(shift_ms<0) = 0;
% shift_ms(shift_ms>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_ms;
% save ls1 shift1 shift2
% 
% % Task 8
% dim = 20;
% lb1 = -5;ub1 = 5;
% lb2 = -30;ub2 = 30;
% shift = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift;
% shift_ms = shift+ls_scale*(rand(1,dim)-0.5)*2;
% shift_ms(shift_ms<0) = 0;
% shift_ms(shift_ms>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_ms;
% save ls2 shift1 shift2
% 
% % Task 9
% dim = 10;
% lb1 = -32;ub1 = 32;
% lb2 = -200;ub2 = 200;
% shift = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift;
% shift_ms = shift+ls_scale*(rand(1,dim)-0.5)*2;
% shift_ms(shift_ms<0) = 0;
% shift_ms(shift_ms>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_ms;
% save ls3 shift1 shift2