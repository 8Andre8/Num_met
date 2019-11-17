syms x;
a = 1; % начальное приближение 
e = 0.001; % точность
N = 100; % количество итераций, чтобы не было зацикливаний 
f =@(x) cos(x) - exp(-x) + 0.5;
g = inline(diff('cos(x) -exp(-x)+0.5', x));
x = g(a); % первое значение 
for i = 1 : N % делаем максимум 100 итераций
    if abs(x - a) <= e
        break
    end
    a = x;
    x = a-f(a)/g(a);
end
disp(['Ответ x = ', num2str(x,8)]);
disp('для проверки точный ответ =');
syms x;
disp(solve(f(x)));