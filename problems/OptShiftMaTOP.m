clc,clear


% %%%%%%%%%%%%%HS Problems%%%%%%%%%%%%%%
% 
% % Problem 1
% dim = 15;
% lb1 = -100;ub1 = 100;
% lb2 = -10;ub2 = 10;
% lb3 = -32;ub3 = 32;
% lb4 = -50;ub4 = 50;
% lb5 = -200;ub5 = 200;
% shift_base1 = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift_base1;
% shift2 = lb2+(ub2-lb2).*shift_base1;
% shift_base2 = rand(1,dim);
% shift3 = lb3+(ub3-lb3).*shift_base2;
% shift4 = lb4+(ub4-lb4).*shift_base2;
% shift5 = lb5+(ub5-lb5).*shift_base2;
% save hs1 shift1 shift2 shift3 shift4 shift5

% % Problem 2
% dim = 20;
% lb1 = -32;ub1 = 32;
% lb2 = -100;ub2 = 100;
% lb3 = -50;ub3 = 50;
% lb4 = -0.5;ub4 = 0.5;
% lb5 = -200;ub5 = 200;
% shift_base1 = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift_base1;
% shift2 = lb2+(ub2-lb2).*shift_base1;
% shift_base2 = rand(1,dim);
% shift3 = lb3+(ub3-lb3).*shift_base2;
% shift_base3 = rand(1,dim);
% shift4 = lb4+(ub4-lb4).*shift_base3;
% shift5 = lb5+(ub5-lb5).*shift_base3;
% save hs2 shift1 shift2 shift3 shift4 shift5
% 
% 
% 
% 
% %%%%%%%%%%%%%%MS Problems%%%%%%%%%%%%%%
% 
ms_scale = 0.2;

% % Problem 3
% dim = 10;
% lb1 = -100;ub1 = 100;
% lb2 = -10;ub2 = 10;
% lb3 = -50;ub3 = 50;
% lb4 = -0.5;ub4 = 0.5;
% lb5 = -10;ub5 = 10;
% shift_base1 = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift_base1;
% shift_base_ms1 = shift_base1+ms_scale*(rand(1,dim)-0.5)*2;
% shift_base_ms1(shift_base_ms1<0) = 0;
% shift_base_ms1(shift_base_ms1>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_base_ms1;
% shift_base2 = rand(1,dim);
% shift3 = lb3+(ub3-lb3).*shift_base2;
% shift_base_ms2 = shift_base1+ms_scale*(rand(1,dim)-0.5)*2;
% shift_base_ms2(shift_base_ms2<0) = 0;
% shift_base_ms2(shift_base_ms2>1) = 1;
% shift4 = lb4+(ub4-lb4).*shift_base_ms2;
% shift_base3 = rand(1,dim);
% shift5 = lb5+(ub5-lb5).*shift_base3;
% save ms1 shift1 shift2 shift3 shift4 shift5

% Problem 4
dim = 15;
lb1 = -30;ub1 = 30;
lb2 = -32;ub2 = 32;
lb3 = -100;ub3 = 100;
lb4 = -10;ub4 = 10;
lb5 = -200;ub5 = 200;
shift_base1 = rand(1,dim);
shift1 = lb1+(ub1-lb1).*shift_base1;
shift_base2 = rand(1,dim);
shift2 = lb2+(ub2-lb2).*shift_base2;
shift_base_ms2 = shift_base2+ms_scale*(rand(1,dim)-0.5)*2;
shift_base_ms2(shift_base_ms2<0) = 0;
shift_base_ms2(shift_base_ms2>1) = 1;
shift5 = lb5+(ub5-lb5).*shift_base_ms2;
shift_base3 = rand(1,dim);
shift3 = lb3+(ub3-lb3).*shift_base3;
shift_base_ms3 = shift_base3+ms_scale*(rand(1,dim)-0.5)*2;
shift_base_ms3(shift_base_ms3<0) = 0;
shift_base_ms3(shift_base_ms3>1) = 1;
shift4 = lb4+(ub4-lb4).*shift_base_ms3;
save ms2 shift1 shift2 shift3 shift4 shift5
% 
% 
% 
% %%%%%%%%%%%%%%LS Problems%%%%%%%%%%%%%%
% 
ls_scale = 0.6;

% % Problem 5
% dim = 20;
% lb1 = -10;ub1 = 10;
% lb2 = -30;ub2 = 30;
% lb3 = -5;ub3 = 5;
% lb4 = -10;ub4 = 10;
% lb5 = -32;ub5 = 32;
% shift_base = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift_base;
% shift_base_ls2 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls2(shift_base_ls2<0) = 0;
% shift_base_ls2(shift_base_ls2>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_base_ls2;
% shift_base_ls3 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls3(shift_base_ls3<0) = 0;
% shift_base_ls3(shift_base_ls3>1) = 1;
% shift3 = lb3+(ub3-lb3).*shift_base_ls3;
% shift_base_ls4 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls4(shift_base_ls4<0) = 0;
% shift_base_ls4(shift_base_ls4>1) = 1;
% shift4 = lb4+(ub4-lb4).*shift_base_ls4;
% shift_base_ls5 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls5(shift_base_ls5<0) = 0;
% shift_base_ls5(shift_base_ls5>1) = 1;
% shift5 = lb5+(ub5-lb5).*shift_base_ls5;
% save ls1 shift1 shift2 shift3 shift4 shift5

% % Problem 6
% dim = 10;
% lb1 = -100;ub1 = 100;
% lb2 = -10;ub2 = 10;
% lb3 = -0.5;ub3 = 0.5;
% lb4 = -200;ub4 = 200;
% lb5 = -50;ub5 = 50;
% shift_base = rand(1,dim);
% shift1 = lb1+(ub1-lb1).*shift_base;
% shift_base_ls2 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls2(shift_base_ls2<0) = 0;
% shift_base_ls2(shift_base_ls2>1) = 1;
% shift2 = lb2+(ub2-lb2).*shift_base_ls2;
% shift_base_ls3 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls3(shift_base_ls3<0) = 0;
% shift_base_ls3(shift_base_ls3>1) = 1;
% shift3 = lb3+(ub3-lb3).*shift_base_ls3;
% shift_base_ls4 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls4(shift_base_ls4<0) = 0;
% shift_base_ls4(shift_base_ls4>1) = 1;
% shift4 = lb4+(ub4-lb4).*shift_base_ls4;
% shift_base_ls5 = shift_base+ls_scale*(rand(1,dim)-0.5)*2;
% shift_base_ls5(shift_base_ls5<0) = 0;
% shift_base_ls5(shift_base_ls5>1) = 1;
% shift5 = lb5+(ub5-lb5).*shift_base_ls5;
% save ls2 shift1 shift2 shift3 shift4 shift5