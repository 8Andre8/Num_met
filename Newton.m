eps = 1e-4;
x1 = sym('x1');
x2 = sym('x2');
f1 = cos(x1 - 1) + x2 - 0.5;
f2 = sin(x2) + 2 * x1 - 2;
X0 = zeros(1, 2);
X = zeros(1, 2);
f1_x1 = diff(f1, 'x1');
f1_x2 = diff(f1, 'x2');
f2_x1 = diff(f2, 'x1');
f2_x2 = diff(f2, 'x2');
X0(1) = 1.5;
X0(2) = -0.5;
delta = norm(X - X0);
while (delta > eps)
    J = [ [double(subs(f1_x1, x1, X0(1))), double(subs(f1_x2, x2, X0(2)))]; 
        [double(subs(f2_x1, x1, X0(1))), double(subs(f2_x2, x2, X0(2)))] ];
    F = [double(subs(subs(f1, x1, X0(1)), x2, X0(2))); double(subs(subs(f2, x1, X0(1)), x2, X0(2)))];
    J_1 = inv(J);
    X = X0 - J_1 * F;
    delta = norm(X - X0);
    X0 = X;
end
fprintf("x1 = %f, x2 = %f\n", X0(1, 1), X0(2, 1));
