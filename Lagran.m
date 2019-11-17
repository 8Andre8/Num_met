X = [0.284 0.883 1.384 1.856 2.644];
Y = [-3.856 -3.953 -5.112 -7.632 -8.011];
x1 = [];
y1 = [];
n = 5;
syms x xi xj;
p = (x - xj) / (xi - xj);
polinom = 0;
for i = 1 : n
    proizv = 1;
    for j = 1 : n
        if j ~= i
            proizv = proizv * subs(subs(p, xi, X(i)), xj, X(j));
        end
    end
    polinom = polinom + proizv * Y(i);
end
for i = 1 : 300
     x1(i) = i * 0.01;
     y1(i) = double(subs(polinom, x, x1(i)));
 end;
 plot(x1, y1);
 grid on;
 fprintf("Значение полинома Лагранжа в точке %.1f = %f\n", 0.8, double(subs(polinom, x, 0.8)));