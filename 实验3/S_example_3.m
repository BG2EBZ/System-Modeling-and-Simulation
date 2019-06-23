close all
clc
clear
g=9.8;
m=1;
L=0.2;
sim('S_example3')
save result1

g=9.8;
m=1;
L=0.5;
sim('S_example3')
save result2

g=9.8;
m=1;
L=1.0;
sim('S_example3')
save result3

g=9.8;
m=1;
L=5.0;
sim('S_example3')
save result4

g=9.8;
m=1;
L=10.0;
sim('S_example3')
save result5

load('result1')
figure(1);
plot(tout,simout(:,1),'g');
hold on
grid on
xlabel('t/s');
ylabel('\theta');
figure(2);
plot(tout,simout(:,2),'g')
xlabel('t/s');
ylabel('d\theta');
hold on
grid on
%

load('result2')
figure(1);
plot(tout,simout(:,1),'b')
figure(2);
plot(tout,simout(:,2),'b')

load('result3')
figure(1);
plot(tout,simout(:,1),'r')
figure(2);
plot(tout,simout(:,2),'r')

load('result4')
figure(1);
plot(tout,simout(:,1),'m')
figure(2);
plot(tout,simout(:,2),'m')

load('result5')
figure(1);
plot(tout,simout(:,1),'c')
legend('L=0.2','L=0.5','L=1.0','L=5.0','L=10.0');
figure(2);
plot(tout,simout(:,2),'c')
legend('L=0.2','L=0.5','L=1.0','L=5.0','L=10.0');