% Variant 8
clear;

a = 1.3;
b = 2.42;
c = 0.83;
x = 1.5;
k = 2;

y = (abs(a ^ 2 - b ^ 2) / sin(k * x)) ...
    + (10 ^ 4 * (abs(sin(k * x) - b * c)) ^ (1/5)) ...
    - (k ^ 2 + tan(3 * k)) / exp(k * x);

% ans
y 