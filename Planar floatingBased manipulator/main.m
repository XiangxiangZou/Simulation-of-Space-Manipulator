clear;clc;
%% 运行仿真

Init_data;  

load_system("test04.slx")     

simOut=sim("test04.slx");     

%% 绘图
close all
t=simOut.tout;

figure(1)
subplot(2,1,1)
plot(t,simOut.q0,'b',"LineWidth",2,DisplayName="Actual")
hold on
plot(t,0.2*sin(0.4*pi*t),"r--","LineWidth",2,DisplayName="Desirable")
title("Attitude Angel")
xlabel("time(s)")
ylabel("Attitude Angel(rad)");
legend("Actual","Desirable")

subplot(2,1,2)
plot(t,simOut.dq0,"g","LineWidth",2)
% yline(0,"r--","LineWidth",2)
title("Attitude Angel Velocity")
xlabel("time(s)")
ylabel("Attitude Angel Velocity(rad/s)");


figure(2)
for i=1:4
    subplot(2,2,i)
    plot(t,simOut.qm(:,i),t,0.2*sin(0.4*pi*t),"r--","LineWidth",2)
    hold on
%     plot(t,0.2*sin(0.4*pi*t),"r--","LineWidth",2,DisplayName="Desirable")
    title("Joint"+i+" Angel")
    xlabel("time(s)")
    ylabel("Attitude Angel(rad)");
    
    legend("Actual","Desirable")
end

% figure(3)
% for i=1:8
%     subplot(4,2,i)
%     plot(t,simOut.f(i,:),"LineWidth",2)
%     hold on
%     title("f"+i)
% end












