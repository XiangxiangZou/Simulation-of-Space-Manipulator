%%平面漂浮基座四连杆机械臂动力学模型推导
close all;clear;clc;
%% 变量定义
syms x(t) y(t) q0(t) q1(t) q2(t) q3(t) q4(t)    
qi=[x(t) y(t) q0(t) q1(t) q2(t) q3(t) q4(t)];       % 广义变量

syms dx(t) dy(t) dq0(t) dq1(t) dq2(t) dq3(t) dq4(t)     
dqi=[dx(t) dy(t) dq0(t) dq1(t) dq2(t) dq3(t) dq4(t)];       % 广义速度

syms ddx ddy ddq0 ddq1 ddq2 ddq3 ddq4       
ddqi={ddx ddy ddq0 ddq1 ddq2 ddq3 ddq4};        % 广义加速度

syms L0 L1 Ls1 L2 Ls2 L3 Ls3 L4     % 连杆和吊具长度
Link=[L0 L1 Ls1 L2 Ls2 L3 Ls3 L4];

syms I0 I1 Is1 I2 Is2 I3 Is3 I4     % 连杆和吊具转动惯量
I={I0 I1 Is1 I2 Is2 I3 Is3 I4};

syms m0 m1 ms1 m2 ms2 m3 ms3 m4     % 连杆和吊具质量
m={m0 m1 ms1 m2 ms2 m3 ms3 m4};

%% 距离矢量
r0=[x;y];

r1=[x+L0*cos(q0)+0.5*L1*cos(q0+q1);
    y+L0*sin(q0)+0.5*L1*sin(q0+q1)];

rs1=[x+L0*cos(q0)+L1*cos(q0+q1)+0.5*Ls1*cos(q0+q1+q2/2);
     y+L0*sin(q0)+L1*sin(q0+q1)+0.5*Ls1*sin(q0+q1+q2/2)];

r2=[x+L0*cos(q0)+L1*cos(q0+q1)+Ls1*cos(q0+q1+q2/2)+0.5*L2*cos(q0+q1+q2);
    y+L0*sin(q0)+L1*sin(q0+q1)+Ls1*sin(q0+q1+q2/2)+0.5*L2*cos(q0+q1+q2)];

rs2=[x+L0*cos(q0)+L1*cos(q0+q1)+Ls1*cos(q0+q1+q2/2)+L2*cos(q0+q1+q2)+0.5*Ls2*cos(q0+q1+q2+q3/2);
     y+L0*sin(q0)+L1*sin(q0+q1)+Ls1*sin(q0+q1+q2/2)+L2*cos(q0+q1+q2)+0.5*Ls2*sin(q0+q1+q2+q3/2)];

r3=[x+L0*cos(q0)+L1*cos(q0+q1)+Ls1*cos(q0+q1+q2/2)+L2*cos(q0+q1+q2)+Ls2*cos(q0+q1+q2+q3/2)+0.5*L3*cos(q0+q1+q2+q3);
    y+L0*sin(q0)+L1*sin(q0+q1)+Ls1*sin(q0+q1+q2/2)+L2*cos(q0+q1+q2)+Ls2*sin(q0+q1+q2+q3/2)+0.5*L3*sin(q0+q1+q2+q3)];

rs3=[x+L0*cos(q0)+L1*cos(q0+q1)+Ls1*cos(q0+q1+q2/2)+L2*cos(q0+q1+q2)+Ls2*cos(q0+q1+q2+q3/2)+L3*cos(q0+q1+q2+q3)+0.5*Ls3*cos(q0+q1+q2+q3+q4/2);
     y+L0*sin(q0)+L1*sin(q0+q1)+Ls1*sin(q0+q1+q2/2)+L2*cos(q0+q1+q2)+Ls2*sin(q0+q1+q2+q3/2)+L3*sin(q0+q1+q2+q3)+0.5*Ls3*sin(q0+q1+q2+q3+q4/2)];

r4=[x+L0*cos(q0)+L1*cos(q0+q1)+Ls1*cos(q0+q1+q2/2)+L2*cos(q0+q1+q2)+Ls2*cos(q0+q1+q2+q3/2)+L3*cos(q0+q1+q2+q3)+Ls3*cos(q0+q1+q2+q3+q4/2)+0.5*L4*cos(q0+q1+q2+q3+q4);
    y+L0*sin(q0)+L1*sin(q0+q1)+Ls1*sin(q0+q1+q2/2)+L2*cos(q0+q1+q2)+Ls2*sin(q0+q1+q2+q3/2)+L3*sin(q0+q1+q2+q3)+Ls3*sin(q0+q1+q2+q3+q4/2)+0.5*L4*sin(q0+q1+q2+q3+q4)];

r={r0,r1,rs1,r2,rs2,r3,rs3,r4};

%% 速度矢量
dr=cell(1,8);
for i=1:8
    dr{1,i}=diff(r{i});
    for j=1:7
        dr{1,i}=subs(dr{1,i},diff(qi(j),t),dqi(j));
    end
end

%% 计算动能
% 各部件动能（平动+转动）
w0=dq0^2;
w1=(dq0+dq1)^2;
w2=(dq0+dq1+dq2/2)^2;
w3=(dq0+dq1+dq2)^2;
w4=(dq0+dq1+dq2+dq3/2)^2;
w5=(dq0+dq1+dq2+dq3)^2;
w6=(dq0+dq1+dq2+dq3+dq4/2)^2;
w7=(dq0+dq1+dq2+dq3+dq4)^2;
w={w0,w1,w2,w3,w4,w5,w6,w7};

T=cell(1,8);
E_k=0;
for i=1:8
    T{1,i}=0.5*m{i}*(dr{1,i}.'*dr{1,i})+0.5*I{i}*w{i};
    E_k=E_k+T{1,i};
end

% 系统总势能为零，根据拉格朗日方程，得到：
L=E_k;

%% 计算各变量偏导对时间的导数
dL_ddqi=cell(1,7);
dL_ddqi_dt=cell(1,7);

for j=1:7
    dL_ddqi{1,j}=functionalDerivative(L,dqi(j));
    dL_ddqi_dt{1,j}=diff(dL_ddqi{1,j},t);
    for k=1:7
        dL_ddqi_dt{1,j}=subs(dL_ddqi_dt{1,j},diff(qi(k),t),dqi(k));
        dL_ddqi_dt{1,j}=subs(dL_ddqi_dt{1,j},diff(dqi(k),t),ddqi(k));
    end
end

%% 计算L对各变量的求导，作差
dL_dqi=cell(1,7);
lg=cell(1,i);
for j=1:7
    dL_dqi{1,j}=functionalDerivative(L,qi(j));
    lg{1,j}=dL_ddqi_dt{1,j}-dL_dqi{1,j};
end

%% 求解质量矩阵(各变量二阶导前面的系数)
M=repmat(m0,7,7);
for j=1:7
    for k=1:7
        [term_coe,term]=coeffs(lg{1,j},ddqi{k});
        if term==1
           M(j,k)=0;
        else
           term_coe=formula(term_coe);
           M(j,k)=term_coe(1);
        end
    end
end

 
%% 求C矩阵

% C=cell(7,1);
% for j=1:7
%     for k=1:7
%         C{j,1}=simplify(lg{j}-M{j,k}*ddqi{k});
%         break
%     end
% end









   

