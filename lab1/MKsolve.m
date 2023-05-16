% Методы Монте-Карло для вычисления интеграла кусочно-заданной функции
% Принимает: N - количество экспериментов
% Возвращает: simple, precise - вычисленные значения для различных способов

function [simple, precise] = MKsolve(N)
    x_min = 0;
    x_max = 3;

    % Простой способ
    y_min = 0;
    y_max = 10;
    xs = rand(1, N) * (x_max - x_min) + x_min;
    ys = rand(1, N) * (y_max - y_min) + y_min;
    
    [n_pos, n_neg] = deal(0, 0);
    for i = 1:N
        func_yi = piecewise_func_lab1(xs(i));
        if func_yi < ys(i) && ys(i) < 0
            n_neg = n_neg + 1;
        elseif 0 <= ys(i) && ys(i) <= func_yi
            n_pos = n_pos + 1;              
        end
    end
    points_portion = (n_pos - n_neg)/N;

    simple = points_portion * (x_max - x_min) * (y_max - y_min);

    % Повышенная точность
    xs = rand(1, N) * (x_max - x_min) + x_min;
    func_ys = arrayfun(@(x) piecewise_func_lab1(x), xs);

    precise = sum(func_ys)*(x_max - x_min) / N;
end