syms x;
a = 1; % ��������� ����������� 
e = 0.001; % ��������
N = 100; % ���������� ��������, ����� �� ���� ������������ 
f =@(x) cos(x) - exp(-x) + 0.5;
g = inline(diff('cos(x) -exp(-x)+0.5', x));
x = g(a); % ������ �������� 
for i = 1 : N % ������ �������� 100 ��������
    if abs(x - a) <= e
        break
    end
    a = x;
    x = a-f(a)/g(a);
end
disp(['����� x = ', num2str(x,8)]);
disp('��� �������� ������ ����� =');
syms x;
disp(solve(f(x)));