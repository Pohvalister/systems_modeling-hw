clear

% 1
v = [1, 2];
w = [-1; -2];
m = [1:2; -1:-1:-2];

% 2
m0 = zeros(2, 2);
m1 = ones(size(m0));
mr = rand(2, 2);
me = diag(2);

% 3  Variant 8: M=m+mr*me–10
%M_check = m + mr * me;
M = m + mr * me - 10;

%4
M_sizes = size(M);
M
disp(['rows: ', num2str(M_sizes(1, 1)), ', cols: ', num2str(M_sizes(1, 2))]);
disp(['max: ', num2str(max(max(M))), ', min: ', num2str(min(min(M)))]);
disp(['sum: ', num2str(sum(sum(M))), ', prod: ', num2str(prod(prod(M)))]);


