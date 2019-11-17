clc;
clear;
% �������� �������
f = @(x) exp(-0.4*x^2) - 0.5*x^2 + 1; % ������� �������
a = -2;
b = 2;
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
disp(['����� x1 = ',num2str(c,8),'; x2 = ' num2str(-c,8) ] );
disp('��� �������� ������ ����� =');
syms x;
disp(solve(f(x)));
