% Нахождение корней уравнений

function practice5_1()

    % x - 6*x^2 + 3*x^3 + 50
    poly_coef = [3, -6, 1, 50];
    poly_roots = roots(poly_coef)

    % sin(2*x)*exp(abs(x))
    function y = my_f2(x)
        y = exp(abs(x)) * sin(2 * x);
    end

    f2_root = [fzero(@my_f2, -8); fzero(@my_f2, 0.001); fzero(@my_f2, 9)]    

end
