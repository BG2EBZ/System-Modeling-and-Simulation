load('AA.dat');

subplot(3,1,1);
a = plot(AA(:,1), AA(:,2));
grid on
set(a,'Color',[0 0 0]);
set(a,'linestyle','-');
xlabel('ʱ��(s)');
ylabel('\alpha(m)');
legend('����1');

subplot(3,1,2);
b = plot(AA(:,1), AA(:,3));
grid on
set(b,'Color',[1 0 0]);
set(b,'linestyle','--');
xlabel('ʱ��(s)');
ylabel('\beta(deg)');
legend('����2');

subplot(3,1,3);
c = plot(AA(:,1), AA(:,4));
grid on
set(c,'Color',[0 1 0]);
set(c,'linestyle','-.');
xlabel('ʱ��(s)');
ylabel('y(m)');
legend('����3');