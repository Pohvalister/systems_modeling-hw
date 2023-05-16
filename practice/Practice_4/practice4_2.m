% Вывод графика функций f4 = sin(r) / r^2

% График трёхмерной поверхности для r = sqrt(x^2 + y^2) 
function practice4_2

    function z = f4(r)
        z = sin(r) ./ (r .^ 2);
    end
    [x,y] = meshgrid(-2*pi:0.2:2*pi);
    z = sqrt(x.^2 + y.^2);
    mesh(x, y, f4(z));
    title('practice4_2');

end
