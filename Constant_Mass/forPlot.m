%% 绘图子程序

subplot(2,1,1)
plot(out.t,out.Phi_b1,'r',out.t,out.Phi_b2,'g', ...
    out.t,out.Phi_b3,'b','LineWidth',2)
title("航天器姿态角")
xlabel("time(s)"),ylabel("Deg(rad)")

subplot(2,1,2)
plot(out.t,out.theta_m1,'r',out.t,out.theta_m2,'g', ...
    out.t,out.theta_m3,'b',out.t,out.theta_m4,'k','LineWidth',2)
title("机械臂的关节角")
xlabel("time(s)"),ylabel("Deg(rad)")

