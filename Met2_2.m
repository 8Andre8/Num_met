clc;
clear;
% �������� �������
f = @(x) exp(-0.4*x^2) - 0.5*x^2 + 1; % ������� �������
a = -1;
b = 0;
e = 0.001;
% ������� ���� 
while abs(b - a) > e
    c = a - (f(a) / (f(b) - f(a)))*(b-a);
    a = b;
    b = c;
end
disp(['����� x1 = ',num2str(c,8),'; x2 = ' num2str(-c,8) ] );
disp('��� �������� ������ ����� =');
syms x;
disp(solve(f(x)));
