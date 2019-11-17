clc;
clear;
% Основные условия
f = @(x) cos(x) - exp(-x)+ 0.5; %искомая функция
a = -1;
b = 1;
e = 0.001;
% Осноной цикл 
while abs(b - a) > e
    c = (b + a) / 2;
    if sign(f(c)) == sign(f(a))
        a = c;
    else
        b = c;
    end
end
disp(['Ответ x = ' num2str(c,8)]);
disp('для проверки точный ответ =');
syms x;
disp(solve(f(x)));
