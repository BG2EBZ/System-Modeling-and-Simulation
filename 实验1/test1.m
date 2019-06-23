A = magic(3);
B = A(1:2,:);
C = A(:,1:2);
D = A(2:3,2:3);
E = B*C;

a = eig(A);
AA = A';
AAA = inv(A);
d = det(A);

F = [2 3 6;1 7 5;9 3 8];
G = A*F;
H = A.*F;
