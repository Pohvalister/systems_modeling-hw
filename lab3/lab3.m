% Лабораторная работа 3 | Вариант 8
% Моделирование аналоговых сигналов

% Вычислений операций:
%   "Интегрирование" 
%   "Дифференцирование" 
%   "Вычисление среднего значения сигнала"
%   "Вычисление энергии"
%   "Вычисление средней мощности"
% для кусочно-заданной функции

function lab3
    
    %   Анализируемый сигнал
    t_1 = 10 / 1000000; % с
    t_2 = 20 / 1000000; % с
    f_0 = 100 * 1000; % Гц
    phi_0 = pi/2;
    A = 100000; % Вd

    syms t
    s(t) = A*t*cos(2*pi*f_0*t+phi_0);
    pretty(simplify(s))
    figure(1)
    fplot(s, [t_1, t_2])

    %   Символьные вычисления
    Ds_theor = diff(s, t);
    pretty(simplify(Ds_theor))
    figure(2)
    hold on
    fplot(Ds_theor, [t_1, t_2])

    %Int_theor = int(s);
    I_theor = double(vpaintegral(s, t, [t_1, t_2]));

    E_theor = double(vpaintegral(s^2, t, [t_1, t_2]));

    P_theor = E_theor / (t_2 - t_1);

    %   Численные методы
    %s_piece = piecewise(t_1 <= t & t <= t_2, s, 0);
    %pretty(s_piece)

    interval_count = 10;
    delta_t = (t_2 - t_1) / interval_count
    t_array = arrayfun(@(k) t_1 + k * delta_t, 0:(interval_count));
    s_array = arrayfun(@(t_i) eval(s(t_i)), t_array);

    Ds_exper = arrayfun( ...
        @(i) (s_array(i + 1) - s_array(i)) / delta_t, ...
        1:(interval_count));

    plot((t_array(1:interval_count) + (delta_t / 2)) , Ds_exper);
    legend('Теоретич', 'Численное')
    hold off

    I_exper = sum( ...
            arrayfun(@(i) (s_array(i) + s_array(i + 1)) / 2, ...
            1:(interval_count)), ...
        "all") * delta_t;

    E_exper = sum(s_array .^ 2, "all") * delta_t;

    P_exper = sum(s_array .^ 2, "all") / interval_count;

    %   Вывод
    disp(' Полученные значения: Полуаналитическое; Численное');
    disp(['Интеграл:', num2str(I_theor), '; ', num2str(I_exper)]);
    disp(['Энергия: ', num2str(E_theor), '; ', num2str(E_exper)]);
    disp(['Мощность:', num2str(P_theor), '; ', num2str(P_exper)]);
    
    E_real = (56*pi^2-3)/(48*10^5*pi^2);

    disp(['Ошибка Энергии:', num2str(abs(E_real - E_exper) / E_real * 100)]);

end