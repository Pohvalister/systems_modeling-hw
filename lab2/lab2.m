% Лабораторная работа 2
% Датчики случайных чисел. Построение гистограмм
% Вариант 8

function lab2
    % График рассматриваемого распределения
    function y = erlang_func(x)
        y = 32 .* x .^ 2 .* exp(-4 .* x);
    end
    x = linspace(0,3);
    %plot(x, erlang_func(x));
    
    % Генерация данных для гистограммы
    hist_values = create_hist_quants(false, true)
    %bar(hist_values);
end