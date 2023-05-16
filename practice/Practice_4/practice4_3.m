% График кусочно-заданной функции 'piecewise_func.m'

function practice4_3

    x = linspace(-10, 10);

    plot(x, arrayfun(@(x) piecewise_func(x), x));
    title('practice4_3');
    axis("auto");
    grid("on");

end
