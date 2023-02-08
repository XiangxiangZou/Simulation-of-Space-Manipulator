function [M_w,M_wm,M_mw,M_m]=Mass(theta_m,d_theta_m,dd_theta_m)
%% 代入数值

% theta_m=[1.5;0.7;1.0;2.3];    
% d_theta_m=[0.1;0.2;0.3;0.4];
% dd_theta_m=[0.05;0.06;0.07;0.08];


x=0;y=0;q0=0;q1=theta_m(1,1);q2=theta_m(2,1);q3=theta_m(3,1);q4=theta_m(4,1);

dx=0;dy=0;dq0=0;dq1=d_theta_m(1,1);dq2=d_theta_m(2,1);dq3=d_theta_m(3,1);dq4=d_theta_m(4,1);

ddx=0;ddy=0;ddq0=0;ddq1=dd_theta_m(1,1);ddq2=dd_theta_m(2,1);ddq3=dd_theta_m(3,1);ddq4=dd_theta_m(4,1);

L0=1;L1=1;Ls1=1;L2=1;Ls2=1;L3=1;Ls3=1;L4=1;    

I0=1;I1=1;Is1=1;I2=1;Is2=1;I3=1;Is3=1;I4=1;

m0=4500; m1=7.5; ms1=1.5; m2=7.5; ms2=1.5; m3=7.5; ms3=1.5; m4=7.5;


load("M_expression.mat");   % 加载M矩阵表达式

% 将M矩阵计算出数值
M=eval(subs(M_expression));

% 提取基座的质量阵
M_w=M(1:3,1:3);

% 耦合矩阵
M_mw=M(4:7,1:3);
M_wm=M(1:3,4:7);

% 提取机械臂的质量阵
M_m=M(4:7,4:7);






   

