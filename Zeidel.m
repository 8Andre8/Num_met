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
X1 = zeros(1, n);
eps = 1e-6;
for i = 1 : n
    d = A(i, i);
    B(i) = B(i) / d;
    A(i, i) = 0;
    for j = 1 : n
        A(i, j) = A(i, j) / d * (-1);
    end
end
for g = 1 : 15
    for i = 1 : n
        X1(i) = B(i);
        sum = 0.0;
        for j = 1 : i  
            if j ~= i
                sum = sum + A(i, j) * X1(j);
            end
        end
        for j = i + 1 : n
            sum = sum + A(i, j) * X(j);
        end
        X1(i) = X1(i) + sum;
    end
    X = X1;
end
fprintf("x1 = %f; x2 = %f; x3 = %f; x4 = %f", X(1), X(2), X(3), X(4));
rref(C)
                
    

    