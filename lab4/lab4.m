% Лабораторная работа 4 | Вариант 8
% Математическое моделирование

function lab4
    %   ЭТАП 1 - Задание ШИМ сигнала

    %   Параметры Вариант 8
    function tau = imp_duration(t) % Функция длительностей импульсов
        tau_0 = 25; % Начальная длительность импульса
        tau = t / 16 + tau_0;
    end

    T = 63; % Период импульса
    kp = 8; % Количество периодов

    A = 10; % Амплитуда колебаний
    nk = 32; % число гармонирующих составляющих
    
    times = 0:(kp*T);
    signal = zeros(1, T*kp + 1);
    for time = times
        sum = 0;
        for k = 1:nk
            sum = sum + ((2*A) / (pi*k)) ...
                        * sin(pi*k*imp_duration(time) / T) ...
                        * cos(2*pi*k*time / T);
        end
        signal(1, time + 1) = (A*imp_duration(time)) / T + sum;
    end
    
    %   Задание ВЧ колебаний
    A_n = 1; % амплитуда ВЧ
    omega_n = 5 * 2*pi / T; % угловая частота ВЧ
    Un = A_n * cos(omega_n * times); % ВЧ колебание
    
    %   Модулированный сигнал
    Urez = signal .* Un;

    % Графики генерации Выходных сигналов
    figure(1)
    subplot(4, 2, 1)
    plot(times, imp_duration(times)); % Изменение импульсов
    title('Изменение длительности импульсов')
    subplot(4, 2, 3)
    plot(times, signal); % Моделирующая функция
    title('Моделирующая функция')
    subplot(4, 2, 4)
    fun_diag = abs(fft(signal));

    plot(fun_diag(1:(kp*T)/2)); % Спектральная диаграмма моделирующей функции
    title('Спектральная диаграмма моделирующей функции')

    subplot(4, 2, 5)
    plot(times, Un); % ВЧ колебания
    title('ВЧ колебания')
    subplot(4, 2, 7)
    plot(times, Urez); % Радиосигнал с ШИМ
    title('Радиосигнал с ШИМ')
    subplot(4, 2, 8)
    diag = abs(fft(Urez));
    plot(diag(1:(kp*T)/2)); % Спектр радиосигнала
    title('Спектральная диаграмма радиосигнала')


    %   ЭТАП 2 - Обфускация сигнала
    function Upom = interference(scale, len) % Функция помех
        Upom = zeros(1, len);
        for i = 1:len
            Upom(1, i) = (rand() - 0.5) * scale;
        end
    end
    
    fade_k = 0.75; % коэффициент затухания полезного сигнала
    Upom = interference(max(Urez)*0.5, kp*T + 1);
    
    %   Моделирование сигнала на приёмнике

    Ukr = (fade_k * Urez) + Upom; % входной сигнал из канала
    input_frecs = fft(Ukr);

    %   ЭТАП 3 - Фильтрация
    function filtered_frec = filter1(frec) % частотно-избирательная фильтрация
        alpha = 100;% параметр фильтра
        if (abs(frec) - alpha >= 0)
            filtered_frec = frec;
        else
            filtered_frec = 0;
        end
    end

    filter1_frecs = arrayfun(@(f) filter1(f), input_frecs); 
    Uk2 = ifft(filter1_frecs);
    Urez2 = Uk2 / fade_k; % усиление сигнала обратно
    
    function filtered_A = filter2(A) % отсечение отрицательной части амплитуды
        if (A > 0)
            filtered_A = A;
        else
            filtered_A = 0;
        end
    end

    Ud = arrayfun(@(A) filter2(A), Urez2);
    Ud_frecs = fft(Ud);

    function filtered_frec = filter3(frec, time) % фильтр нижних частот
        f = 10; % верхняя частота среза фильтра
        n = 2; % порядок фильтра
        filtered_frec = frec / (1 + (time / (f * n)) ^ (2 * n));
    end
    
    Ufiltered_frecs = arrayfun(@(t) filter3(Ud_frecs(1,t), t - 1), 1:kp*T + 1);
    Ufiltered = ifft(Ufiltered_frecs);
    
    % ЭТАП 4 - Получение цифровых импульсов
    function determ_imp = determ(A) % огибающая фукция сигнала
        m = 2; % параметр для детерминирования
        if (A > m)
            determ_imp = 1;
        else
            determ_imp = 0;
        end
    end

    Udet = arrayfun(@(A) determ(A), Ufiltered);

    % Графики Фильтрованных сигналов

    figure(2)
    subplot(5, 2, 1)
    plot(times, Upom); % Помехи
    title('Помехи')
    subplot(5, 2, 3)
    plot(times, Ukr); % Входная функция
    title('Входной сигнал')
    subplot(5, 2, 4)
    plot(abs(input_frecs(1:(kp*T)/2))); % Частоты на входе
    title('Частоты на входе')

    subplot(5, 2, 6)
    plot(abs(filter1_frecs(1:(kp*T)/2))); % Частоты после фильтра 1
    title('Частоты после ВЧ фильтра')
    subplot(5, 2, 5)
    plot(times, Uk2); % Сигнал после фильтра 1
    title('Сигнал после ВЧ фильтра')

    subplot(5, 2, 7)
    plot(times, Ud); % Сигнал после фильтра 2
    title('Сигнал после Усилителя')

    subplot(5, 2, 8)
    plot(abs(Ud_frecs(1:(kp*T)/2))); % Частоты после фильтра 2
    title('Частоты после Усилителя')

    subplot(5, 2, 10)
    plot(abs(Ufiltered_frecs(1:(kp*T)/2))); % Частоты после фильтра 3
    title('Частоты после НЧ фильтра')

    subplot(5, 2, 9)
    plot(times, Ufiltered); % Сигнал после фильтра 3
    title('Сигнал после НЧ фильтра')
    
    figure(3)
    plot(times, Udet); % Спектральная диаграмма моделирующей функции
    ylim([0, 2])

    
end