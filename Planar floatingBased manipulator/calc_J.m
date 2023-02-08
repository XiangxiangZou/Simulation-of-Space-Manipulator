function [Tm]=calc_J(qm,f)

% 数值计算
% qm=[0.2,0.4,0.5,0.3].';
% f=[800 300 500 200 300 400 600 700 ].';


L1=1; L2=1; L3=1; L4=1;
h=0.2; d=0.05; r=0.05; phi=pi/3;
q1=qm(1);q2=qm(2);q3=qm(3);q4=qm(4);


J_expression=load("J_expression.mat").J;


J=eval(subs(J_expression));


Tm=J*f;
