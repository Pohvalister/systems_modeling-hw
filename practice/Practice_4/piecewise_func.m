% Файл-функция: Кусочно-заданная функция для части 3, практики 4

function y = piecewise_func(x)
    if (x <= 0)
        y = sqrt(1 + abs(x));
    else
        y = (1 + 3 * x) / ((1 + x) ^ (1/3) + 2);
    end
end

