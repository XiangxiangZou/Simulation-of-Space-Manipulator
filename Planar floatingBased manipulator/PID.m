clear all;
clc;

%设置PID参数
Kp=1;
Ki=0.5;
Kd=0.2;

%设置系统模拟参数
T=0.01;
final_time=20;
time=0:T:final_time;

%初始化变量
e=zeros(1,length(time));
u=zeros(1,length(time));
y=zeros(1,length(time));

%系统输入
r=ones(1,length(time))*1;

%积分误差
inte_error=0;

%微分误差
diff_error=0;

%前一次误差
pre_error=0;

%PID控制循环
for i=2:length(time)
    
    %误差
    e(i)=r(i)-y(i-1);
    
    %积分误差
    inte_error=inte_error+e(i)*T;
    
    %微分误差
    diff_error=(e(i)-pre_error)/T;
    
    %PID控制计算
    u(i)=Kp*e(i)+Ki*inte_error+Kd*diff_error;
    
    %系统模拟
    y(i)=y(i-1)+T*u(i);
    
    %记录前一次误差
    pre_error=e(i);
end

%绘图
plot(time,y,'r','LineWidth',2);
hold on;
plot(time,r,'b','LineWidth',2);
xlabel('Time(s)');
ylabel('Output');
legend('System Output','Reference');
