% Вывод графиков функций f1 f2 f3

% Вывод графиков должен быть осуществлен в одном окне, графики должны быть
% подписаны, отмасштабированы.
function practice4_1

    function y = f1(x)
        y = sin(x) .* exp(x);
    end
    function y = f2(x)
        y = sin(x) .* (x .^ 2);
    end
    function y = f3(x)
        y = sin(x) .* x;
    end

    x = linspace(-2*pi, 2*pi);

    plot(x, f1(x), 'r', x, f2(x), 'g', x, f3(x), 'm');
    title('practice4_1');
    legend('sin(x) * e^x', 'sin(x) * x^2', 'sin(x) * x', 'Location','southwest');
    axis("auto");
    grid("on");

end