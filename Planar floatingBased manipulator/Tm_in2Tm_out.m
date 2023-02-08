function [Tm_out,f]=Tm_in2Tm_out(qm,Tm_in)

% % for test
% qm=[0.2,0.4,0.5,0.3].';
% Tm=[80 30 50 20].';


L1=1; L2=1; L3=1; L4=1;
h=0.2; d=0.05; r=0.05; phi=pi/3;
q1=qm(1);q2=qm(2);q3=qm(3);q4=qm(4);

J_expression=load("J_expression.mat").J;

J=eval(subs(J_expression));

J_hat=pinv(J);
f=J_hat*Tm_in;

for i=1:8
    if f(i,:)<=0
        f(i,:)=0;
    end
    if f(i,:)>=1000
        f(i,:)=1000;
    end
end

Tm_out=J*f;

