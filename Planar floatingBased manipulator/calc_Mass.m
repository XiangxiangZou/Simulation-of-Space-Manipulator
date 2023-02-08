function [M1,M2,M3,M4]=calc_Mass(w0,qm)

% w0=0;
% qm=[0.5;0.3;0.8;0.6];

q0=w0;q1=qm(1,1);q2=qm(2,1);q3=qm(3,1);q4=qm(4,1);

L0=1;L1=1;Ls1=1;L2=1;Ls2=1;L3=1;Ls3=1;L4=1;    

I0=1;I1=1;Is1=1;I2=1;Is2=1;I3=1;Is3=1;I4=1;

m0=4500; m1=7.5; ms1=1.5; m2=7.5; ms2=1.5; m3=7.5; ms3=1.5; m4=7.5;


load("M_expression.mat");   % 加载M矩阵表达式

% 将M矩阵计算出数值                  
M=eval(subs(M_expression));

Mr=M(1:2,1:2);
Mw=M(3,3);
Mm=M(4:7,4:7);

Mrw=M(1:2,3);
Mwr=Mrw.';

Mrm=M(1:2,4:7);
Mmr=Mrm.';

Mwm=M(3,4:7);
Mmw=Mwm.';

M1=Mw-Mwr*inv(Mr)*Mrw;
M2=Mmw-Mmr*inv(Mr)*Mrw;
M3=Mwm-Mwr*inv(Mr)*Mrm;
M4=Mm-Mmr*inv(Mr)*Mrm;

% M1=Mw-Mwr/Mr*Mrw
% M2=Mmw-Mmr/Mr*Mrw
% M3=Mwm-Mwr/Mr*Mrm
% M4=Mm-Mmr/Mr*Mrm






