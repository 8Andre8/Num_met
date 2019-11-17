clc;
clear;
% �������� �������
f = @(x) cos(x) - exp(-x) + 0.5; %������� �������
a = -1;
b = 0;
e = 0.001;
% ������� ���� 
while abs(b - a) > e
    c = b - (f(b) * (a - b)) / (f(a) - f(b));
    a = b;
    b = c;
end
disp(['����� x = ', num2str(c,8)]);
disp('��� �������� ������ ����� =');
syms x;
disp(solve(f(x)));