% Лабораторная работа 4 | Вариант 8
% Математическое моделирование

function lab4
    % Параметры ШИМ сигнала
    function tau = imp_duration(t) % Функция длительностей импульсов
        tau_0 = 25; % Начальная длительность импульса
        tau = t / 16 + tau_0;
    end

    T = 63; % Период импульса
    kp = 8; % Количество периодов

    A = 10; % Амплитуда колебаний
    nk = 32; % число гармонирующих составляющих

    % Задание ШИМ сигнала
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
    
    % Задание ВЧ колебаний
    A_n = 1; % амплитуда ВЧ
    omega_n = 5 * 2*pi / T; % угловая частота ВЧ
    Un = A_n * cos(omega_n * times); % ВЧ колебание
    
    % Модулированный сигнал
    Urez = signal .* Un;

    % Графики
    figure(1)
    subplot(4, 2, 1)
    plot(times, imp_duration(times)); % Изменение импульсов
    subplot(4, 2, 3)
    plot(times, signal); % Моделирующая функция
    subplot(4, 2, 4)
    fun_diag = abs(fft(signal));
    plot(fun_diag(1:(kp*T)/2)); % Спектральная диаграмма моделирующей функции

    subplot(4, 2, 5)
    plot(times, Un); % ВЧ колебания
    subplot(4, 2, 7)
    plot(times, Urez); % Радиосигнал с ШИМ
    subplot(4, 2, 8)
    diag = abs(fft(Urez));
    plot(diag(1:(kp*T)/2)); % Спектр радиосигнала
end