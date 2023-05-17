% Функция построения гистограммы выборки
% Выборка формируется созданным генератором erlang_rand(3, 4)

function Y = create_hist_quants(show_stat_interior, show_stat_graph)
    quants = zeros(1, 10);
    values = [];
    [v_min, v_max] = deal(0, 0);

    function quants = place_val(new_val, v_min, v_max, quants)
        if (v_min < v_max)
            place = ceil(10 * (new_val - v_min) / (v_max - v_min));
            if (1 <= place && place <= 10)
                quants(1, place) = quants(1, place) + 1;
            elseif (new_val == v_min)
                quants(1, 1) = quants(1, 1) + 1;
            end
        end
    end

    mean_values = [];
    disp_values = [];

    while (min(quants) < 100)
        new_val = erlang_rand(3,4,1);
        values = [values, new_val];
        quants = place_val(new_val, v_min, v_max, quants);

        p_out = (numel(values) - sum(quants)) / numel(values);

        if (p_out >= 0.01)
            [v_min, v_max] = deal(min(values), max(values));
            quants = zeros(1, 10);
            for value = values
                quants = place_val(value, v_min, v_max, quants);
            end
        end

        if (show_stat_interior)
            disp(['Выборочное среднее ', num2str(mean(values)), ...
                '; Выборочная дисперсия ', num2str(var(values))])
        end
        if (show_stat_graph)
            mean_values = [mean_values, mean(values)];
            disp_values = [disp_values, var(values)];
        end

    end

    total = numel(values);
    disp(['Сгенерировано значений: ', num2str(total)]);
    disp(['Выборочное среднее ', num2str(mean(values)), ...
        '; Выборочная дисперсия ', num2str(var(values))])

    if (show_stat_graph)
        real_mean = 3/4; % k/l
        real_disp = 3/16; % k/l^2

        subplot(1,2,1);
        plot(mean_values);
        yline(real_mean);
        legend('Оценка по выборке','Теоретическое значение')
        xlabel('Объём выборки');
        ylabel('Мат. ожидание');

        subplot(1,2,2);
        plot(disp_values);
        yline(real_disp);
        legend('Оценка по выборке','Теоретическое значение')
        xlabel('Объём выборки');
        ylabel('Дисперсия');
    end

    Y = quants;
end