clc;
clear;
% �������� �������
f = @(x) cos(x) - exp(-x)+ 0.5; %������� �������
a = -1;
b = 1;
e = 0.001;
% ������� ���� 
while abs(b - a) > e
    c = (b + a) / 2;
    if sign(f(c)) == sign(f(a))
        a = c;
    else
        b = c;
    end
end
disp(['����� x = ' num2str(c,8)]);
disp('��� �������� ������ ����� =');
syms x;
disp(solve(f(x)));
