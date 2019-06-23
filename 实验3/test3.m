hold on
grid on
l1 = plot(tout,simout1);
set(l1,'linestyle','-');
set(l1,'Color',[1 0 1]);
l2 = plot(tout,simout2);
set(l2,'linestyle','--');
set(l2,'Color',[0 0 0]);
xlabel('t/s');
ylabel('y');
legend('statespace','integration');