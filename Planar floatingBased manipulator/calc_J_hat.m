function [yf]=calc_J_hat(qm,Tm)
%% 

% % 数值计算
% qm=[0.2,0.4,0.5,0.3].';
% Tm=[80 30 50 20].';


% L1=1; L2=1; L3=1; L4=1;
% h=0.2; d=0.05; r=0.05; phi=pi/3;
% q1=qm(1);q2=qm(2);q3=qm(3);q4=qm(4);
% 
% J_expression=load("J_expression.mat").J;



% 
% J=eval(subs(J_expression));
% 
% J_hat=pinv(J);
% 
% f=J_hat*Tm;


%% 

syms f1 f2 f3 f4 f5 f6 f7 f8 

L1=1; L2=1; L3=1; L4=1;
h=0.2; d=0.05; r=0.05; phi=pi/3;
q1=qm(1);q2=qm(2);q3=qm(3);q4=qm(4);

J_expression=load("J_expression.mat").J;

J=eval(subs(J_expression));


f=[f1,f2,f3,f4,f5,f6,f7,f8]';

[yf1,yf2]=solve(Tm(1)==J(1,:)*f,f1>=10,f1<=1000,f2>=10,f2<=1000);
yf1=eval(yf1);
yf2=eval(yf2);

[yf3,yf4]=solve(Tm(2)==J(2,:)*f,f3>=10,f3<=1000,f4>=10,f4<=1000);
yf3=eval(yf3);
yf4=eval(yf4);

[yf5,yf6]=solve(Tm(3)==J(3,:)*f,f5>=10,f5<=1000,f6>=10,f6<=1000);
yf5=eval(yf5);
yf6=eval(yf6);

[yf7,yf8]=solve(Tm(4)==J(4,:)*f,f7>=10,f7<=1000,f8>=10,f8<=1000);
yf7=eval(yf7);
yf8=eval(yf8);

yf=[yf1;yf2;yf3;yf4;yf5;yf6;yf7;yf8];







