clc;
clear;
% Основные условия
f = @(x) exp(-0.4*x^2) - 0.5*x^2 + 1; % искомая функция
a = -1;
b = 0;
e = 0.001;
% Осноной цикл 
while abs(b - a) > e
    c = b - (f(b) * (a - b)) / (f(a) - f(b));
    a = b;
    b = c;
end
disp(['Ответ x1 = ',num2str(c,8),'; x2 = ' num2str(-c,8) ] );
disp('для проверки точный ответ =');
syms x;
disp(solve(f(x)));