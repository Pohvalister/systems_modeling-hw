% Интегрирование функции

function practice5_2()
    function y = for_integr(x)
        y = 20 .* log( x.^2 + 1 ) - 0.1 .* x.^3;
    end

    dx = 0.2;
    x = -5:dx:15;
    I_1 = trapz(x, for_integr(x));

    I_2 = integral(@for_integr,-5, 15); % instead of deprecated quad8 & quadl

    % символьные вычисления
    syms x
    for_integr_s = 20 * log(x^2 + 1) - 0.1 * x^3;
    pretty(for_integr_s)
    I_3 = double(int(for_integr_s, x, -5, 15));

    disp(['trapz: ', num2str(I_1), ', quad8: ', num2str(I_2), ', syms: ', num2str(I_3)]);
end
