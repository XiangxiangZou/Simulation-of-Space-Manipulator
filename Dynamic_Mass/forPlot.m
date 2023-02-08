%% 绘图子程序

figure(1)
subplot(2,1,1)
plot(out.tout,out.Phi_b1,'r',out.tout,out.Phi_b2,'g', ...
    out.tout,out.Phi_b3,'b','LineWidth',2)
title("航天器姿态角")
xlabel("time(s)"),ylabel("Deg(rad)")

subplot(2,1,2)
plot(out.tout,out.theta_m1,'r',out.tout,out.theta_m2,'g', ...
    out.tout,out.theta_m3,'b',out.tout,out.theta_m4,'k','LineWidth',2)
title("机械臂的关节角")
xlabel("time(s)"),ylabel("Deg(rad)")

% 
% figure(2)
% 
% subplot(2,1,1)
% plot(out.tout,out.Phi_b_error1,'r--',out.tout,out.Phi_b_error2, ...
%     'g--',out.tout,out.Phi_b_error3,'b--',"LineWidth",2)
% 
% title("航天器姿态角误差")
% xlabel("time(s)"),ylabel("Deg(rad)")
% 
% subplot(2,1,2)
% plot(out.tout,out.theta_m_error1,'r--',out.tout,out.theta_m_error2, ...
%     'g--',out.tout,out.theta_m_error3,'b--',out.tout,out.theta_m_error4,'k--',"LineWidth",2)
% title("机械臂关节角误差")
% xlabel("time(s)"),ylabel("Deg(rad)")

