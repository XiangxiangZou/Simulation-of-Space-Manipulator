
figure(1)

subplot(2,1,1)
plot(out.tout,out.q0,'b',"LineWidth",2)
hold on
yline(0.1,"r--","LineWidth",2)
title("Attitude Angel")
xlabel("time(s)")
ylabel("Attitude Angel(rad)");ylim([0,0.2])
legend("Actual","Desirable")

subplot(2,1,2)
plot(out.tout,out.dq0,"g","LineWidth",2)
yline(0,"r--","LineWidth",2)
title("Attitude Angel Velocity")
xlabel("time(s)")
ylabel("Attitude Angel Velocity(rad/s)");ylim([-0.1,0.1])


figure(2)
subplot(2,2,1)
plot(out.tout,out.qm1,'y',"LineWidth",2)
hold on
yline(0,"r--","LineWidth",2)
title("Joint1 Angel")
xlabel("time(s)")
ylabel("Joint1 Angel(rad)");ylim([-0.5,1.5])
legend("Actual","Desirable")

subplot(2,2,2)
plot(out.tout,out.qm2,'g',"LineWidth",2)
hold on
yline(0,"r--","LineWidth",2)
title("Joint2 Angel")
xlabel("time(s)")
ylabel("Joint2 Angel(rad)");ylim([-0.5,1.5])
legend("Actual","Desirable")

subplot(2,2,3)
plot(out.tout,out.qm3,'b',"LineWidth",2)
hold on
yline(0,"r--","LineWidth",2)
title("Joint3 Angel")
xlabel("time(s)")
ylabel("Joint3 Angel(rad)")
legend("Actual","Desirable")

subplot(2,2,4)
plot(out.tout,out.qm4,'m',"LineWidth",2)
hold on
yline(0,"r--","LineWidth",2)
title("Joint4 Angel")
xlabel("time(s)")
ylabel("Joint4 Angel(rad)")
legend("Actual","Desirable")

figure(3)
hold on
for i=1:8
    subplot(4,2,i)
    plot(out.tout,out.f(i,:),"LineWidth",2)
    subtitle("f"+i)
end
% yline(0,"r--","LineWidth",2)

% legend("f1","f2","f3","f4","f5","f6","f7","f8")






