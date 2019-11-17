A = [ 2.591, 0.512, 0.128, 0.195; 
      0.203, 3.469, 0.572, 0.168; 
      0.256, 0.273, 2.994, 0.501; 
      0.381, 0.219, 0.176, 5.903 ];
B = [ 0.159;
      0.280;
      0.134;
      0.864 ];
C = cat(2, A, B);
n = length(A);
X = zeros(1, n);
Y = zeros(1, n);
d = zeros(1, n);
U = A;
L = zeros(n);
for i = 1 : n
    for j = i : n
        L(j, i) = U(j, i) / U(i, i);
    end
end
for k = 2 : n
    for i = k - 1 : n
        for j = i : n
            L(j, i) = U(j, i) / U(i, i);
        end
    end
    for i = k : n
        for j = k - 1 : n
            U(i, j) = U(i, j) - L(i, k - 1) * U(k - 1, j);
        end
    end
end
for i = 1 : n
    sum_s = 0.0;
    for j = 1 : i
        sum_s = sum_s + L(i, j) * Y(j);
    end
    Y(i) = B(i) - sum_s;
end
for i = n : -1 : 1
    sum_s = 0.0;
    for j = i + 1 : n
        sum_s = sum_s + U(i, j) * X(j);
    end
    X(i) = (Y(i) - sum_s) / U(i, i);
end
fprintf("x1 = %f; x2 = %f; x3 = %f; x4 = %f", X(1), X(2), X(3), X(4));
rref(C)