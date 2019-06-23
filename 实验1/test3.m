load('AA.dat');

subplot(3,1,1);
a = plot(AA(:,1), AA(:,2));
grid on
set(a,'Color',[0 0 0]);
set(a,'linestyle','-');
xlabel('时间(s)');
ylabel('\alpha(m)');
legend('曲线1');

subplot(3,1,2);
b = plot(AA(:,1), AA(:,3));
grid on
set(b,'Color',[1 0 0]);
set(b,'linestyle','--');
xlabel('时间(s)');
ylabel('\beta(deg)');
legend('曲线2');

subplot(3,1,3);
c = plot(AA(:,1), AA(:,4));
grid on
set(c,'Color',[0 1 0]);
set(c,'linestyle','-.');
xlabel('时间(s)');
ylabel('y(m)');
legend('曲线3');