
ezplot('cos(x1 - 1) + x2 - 0.5', [-3, 4]); hold;
ezplot('sin(x2) + 2 * x1 - 2', [-3 4]); grid;
eps = 1e-4;
x1 = sym('x1');
x2 = sym('x2');
f1 = 0.5 - cos(x1 - 1);
f2 = 1 - 0.5 * sin(x2);
X0 = zeros(1, 2);
X = zeros(1, 2);
X0(1) = 1.5;
X0(2) = -0.5;
delta = norm(X - X0);
while(delta > eps)
    F = [double(subs(f1, x1, X0(2))), double(subs(f2, x2, X0(1)))];
    X = F;
    delta = norm(X - X0);
    X0 = X;
end
fprintf("x1 = %f, x2 = %f\n", X0(2), X0(1));

