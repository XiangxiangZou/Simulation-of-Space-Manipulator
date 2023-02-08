%%建立绳索上的力与关节力之间的映射关系，得到两者之间的映射关系矩阵

tic
syms L1 L2 L3 L4;   % 杆长

syms q1(t) q2(t) q3(t) q4(t);   % 关节角

syms dq1(t) dq2(t) dq3(t) dq4(t);  

syms h d r phi;     % 吊具参数

%% 模组1  
%只有后半部分
% 第一根绳
l112=sqrt(h^2+d^2+L1^2-2*sqrt(h^2+d^2)*L1*cos(pi-q1-phi)-r^2);

dl112_dt=diff(l112,t);
dl112_dt=subs(dl112_dt,diff(q1,t),dq1);

J_112=coeffs(dl112_dt,dq1);

% 第二根绳
l122=sqrt(h^2+d^2+L1^2-2*sqrt(h^2+d^2)*L1*cos(pi+q1-phi)-r^2);

dl122_dt=diff(l122,t);
dl122_dt=subs(dl122_dt,diff(q1,t),dq1);

J_122=coeffs(dl122_dt,dq1);

%% 模组2
% 第一根绳
l211=sqrt(h^2+d^2+L1^2-2*sqrt(h^2+d^2)*L1*cos(pi-q2/2-phi)-r^2);% 力与关节角之间关系

dl211_dt=diff(l211,t);
dl211_dt=subs(dl211_dt,diff(q2,t),dq2);% 绳子长度变化与角度变化之间关系

J_211=coeffs(dl211_dt,dq2);     % 提取系数
J_212=subs(J_211,L1,L2);    

J_21=J_211+J_212;

% 第二根绳
l221=sqrt(h^2+d^2+L1^2-2*sqrt(h^2+d^2)*L1*cos(pi+q2/2-phi)-r^2);

dl221_dt=diff(l221,t);
dl221_dt=subs(dl221_dt,diff(q2,t),dq2);

J_221=coeffs(dl221_dt,dq2);
J_222=subs(J_221,L1,L2);

J_22=J_221+J_222;

%% 模组3
% 第一根绳
l311=sqrt(h^2+d^2+L2^2-2*sqrt(h^2+d^2)*L2*cos(pi-q3/2-phi)-r^2);

dl311_dt=diff(l311,t);
dl311_dt=subs(dl311_dt,diff(q3,t),dq3);

J_311=coeffs(dl311_dt,dq3);
J_312=subs(J_211,L2,L3);

J_31=J_311+J_312;

% 第二根绳
l321=sqrt(h^2+d^2+L2^2-2*sqrt(h^2+d^2)*L2*cos(pi+q3/2-phi)-r^2);

dl321_dt=diff(l321,t);
dl321_dt=subs(dl321_dt,diff(q3,t),dq3);

J_321=coeffs(dl321_dt,dq3);
J_322=subs(J_321,L2,L3);

J_32=J_321+J_322;

%% 模组4
% 第一根绳
l411=sqrt(h^2+d^2+L3^2-2*sqrt(h^2+d^2)*L3*cos(pi-q4/2-phi)-r^2);

dl411_dt=diff(l411,t);
dl411_dt=subs(dl411_dt,diff(q4,t),dq4);

J_411=coeffs(dl411_dt,dq4);
J_412=subs(J_411,L3,L4);

J_41=J_411+J_412;

% 第二根绳
l421=sqrt(h^2+d^2+L3^2-2*sqrt(h^2+d^2)*L3*cos(pi+q4/2-phi)-r^2);

dl421_dt=diff(l421,t);
dl421_dt=subs(dl421_dt,diff(q4,t),dq4);

J_421=coeffs(dl421_dt,dq4);
J_422=subs(J_421,L3,L4);

J_42=J_421+J_422;

%% 雅可比矩阵
J=[J_112  J_122   0     0   0    0    0   0;
     0       0   J_21 J_22  0    0    0   0;
     0       0    0     0  J_21 J_32  0   0;
     0       0    0     0   0    0  J_41 J_42]
toc






