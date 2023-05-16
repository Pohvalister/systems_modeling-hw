% Генератор случайных чисел для Варианта 8
% Случайная величина распределена по закону Эрланга(k, l)
% amount - количество требуемых чисел

function As_erl = erlang_rand(k, l, amount)

    % Генератор случайного числа с экпоненциальным законом распределения
    function As_exp = exp_rand(l, amount)
        As = rand(1, amount); % базовое распределение
        As_exp = (-1 / l) .* log(As);
    end
    
    As_erl = zeros(1, amount);
    for i = 1:amount
        As_erl(1, i) = sum(exp_rand(l,k));
    end
end