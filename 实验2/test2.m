t0 = 0;%时间起始
t1 = 10;%时间终止
h = 0.01;%时间间隔
A = [-3 0.5;-1 -7];
B = [0 1];
n = (t1 - t0)/h;
t = zeros(n + 1, 1);
x1 = zeros(n + 1, 1);
x2 = zeros(n + 1, 1);
y = zeros(n + 1, 1);
x1(1) = 0.3;%x1起始值
x2(1) = -0.7;%x2起始值
y(1) = [1 -2]*[x1(1) x2(1)]';%y初始值
for i = 1:n
    t(i + 1) = t(i) + h;
    u = x1(i) - x2(i);
    
    x1k1(i) = funcx1(x1(i),x2(i));
    x2k1(i) = funcx2(x2(i));
    x1k2(i) = funcx1(x1(i)+0.5*h*x1k1(i),x2(i)+0.5*h*x2k1(i));
    x2k2(i) = funcx2(x2(i)+0.5*h*x2k1(i));
    x1k3(i) = funcx1(x1(i)+0.5*h*x1k2(i),x2(i)+0.5*h*x2k2(i));
    x2k3(i) = funcx2(x2(i)+0.5*h*x2k2(i));
    x1k4(i) = funcx1(x1(i)+h*x1k3(i),x2(i)+h*x2k3(i));
    x2k4(i) = funcx2(x2(i)+h*x2k3(i));
    x1(i + 1) = x1(i) + h*(x1k1(i) + 2*x1k2(i) + 2*x1k3(i) + x1k4(i))/6;
    x2(i + 1) = x2(i) + h*(x2k1(i) + 2*x2k2(i) + 2*x2k3(i) + x2k4(i))/6;
    
    y(i + 1) = funcy(x1(i),x2(i));
end
figure(1);
subplot(2,1,1);
lx1=plot(t,x1);
set(lx1,'linestyle','-');
set(lx1,'Color',[0 0 1]);
xlabel('t/s');
legend('x1');
subplot(2,1,2);
lx2=plot(t,x2);
set(lx2,'linestyle','--');
set(lx2,'Color',[0 1 0]);
xlabel('t/s');
legend('x2');
figure(2);
ly=plot(t,y);
set(ly,'linestyle','-.');
set(ly,'Color',[1 0 0]);
xlabel('t/s');
ylabel('y');



