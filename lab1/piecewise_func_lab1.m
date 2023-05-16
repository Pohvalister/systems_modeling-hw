% Функция для Варианта 8
% Кусочно-заданная функция: 
%   веса   5; 5; 2,5
%   номера 1; 1; 4

function y = piecewise_func_lab1(t)
    function y = f1(t)
        y = sin(2 * pi * t) + 1;
    end

    function y = f2(t)
        y = 2 * t - 1;
    end

    function y = f3(t)
        y = 4 * t^2 - 1;
    end

    function y = f4(t)
        y = 2 / (t + 1);
    end


    if (t < 1)
        y = 5 * f1(t);
    elseif (1 <= t && t <= 2)
        y = 5 * f1(t - 1);
    else
        y = 2.5 * f4(t - 2);
    end
end