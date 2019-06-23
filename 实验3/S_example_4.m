%%根据仿真数据绘制相关变量曲线
clear
close all
clc
N = 2.5;
sim('S_example4')
data1=[Data(:,1:16),t,Data(:,17)];
N = 3;
sim('S_example4')
data2=[Data(:,1:16),t,Data(:,17)];
N = 3.5;
sim('S_example4')
data3=[Data(:,1:16),t,Data(:,17)];

rad2Deg=180/pi;

figure(1); %轨迹
hold on
plot(data1(:,1),data1(:,2));
plot(data2(:,1),data2(:,2));
plot(data3(:,1),data3(:,2));
plot(data1(:,3),data1(:,4),'r.-');
title('Trajectory');
xlabel('x/m')
ylabel('y/m')
legend('N=2.5','N=3','N=3.5')

figure(2);%攻角
hold on
plot(data1(:,17),data1(:,18)*rad2Deg);
plot(data2(:,17),data2(:,18)*rad2Deg);
plot(data3(:,17),data3(:,18)*rad2Deg);
title('alpha');
xlabel('t/s')
ylabel('\alpha/deg')
legend('N=2.5','N=3','N=3.5')
