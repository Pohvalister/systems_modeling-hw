% Лабораторная работа 1
% Вычисление определённых интегралов методом Монте-Карло

function lab1
    %x = linspace(0, 3);
    %plot(x, arrayfun(@(x) piecewise_func_lab1(x), x));
    
    MK_params = 1:14;
    [results_S, results_P] = arrayfun(@(i) MKsolve(2^i), MK_params)
    real_val = 5 + 5 + 3.46574;

    plot(MK_params,results_S,'r', ...
        MK_params, results_P, 'g', ...
        MK_params, real_val*ones(size(MK_params)), 'm');
    title('Сравнение методов')
    legend('Простой МК', 'Точный МК', 'Реальная величина');
    xlabel('log(Количества точек)')
    ylabel('Вычисленное значение')

end