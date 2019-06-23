v = [0 500 2000 5000];
x = [0:1:5000];
k = [1e-5 1.15e-5 1.8e-5 4.0e-5];
n = length(k);

%拉格朗日插值
y1=0;
for i=1:n
    t=ones(1,length(x));
    for j=1:n
        if j~=i
            t=t.*(x-v(j))/(v(i)-v(j));
        end
    end
    y1=y1+t*k(i);
end

%一维线性插值
y2=zeros(1,5001);
for j=0:5000
    for i=1:3
        if j>=v(i)&&j<=v(i+1)
            y2(j+1)=k(i)*((j-v(i+1))/(v(i)-v(i+1)))+k(i+1)*((j-v(i))/(v(i+1)-v(i)));
            break;
        end
    end

end

%最小二乘法拟合
y3=zeros(1,5001);
R = [0 v(2)^2 v(3)^2 v(4)^2;0 v(2) v(3) v(4);1 1 1 1]';
K = [k(1) k(2) k(3) k(4)]';
A = inv(R'*R)*R'*K;
a = A(1);
b = A(2);
c = A(3);
for i=0:5000
   y3(i+1)= a*(i)^2 + b*i + c;
end


hold on
l1=plot(x,y1,'r');
set(l1,'linestyle','-');
l2=plot(x,y2,'g');
set(l2,'linestyle','--');
l3=plot(x,y3,'b');
set(l3,'linestyle',':');
l4=plot(v,k,'*');
set(l4,'Color',[1 0 1]);
xlabel('速度(m/s)');
ylabel('k');
legend('拉格朗日插值','一维线性插值','最小二乘法拟合');
