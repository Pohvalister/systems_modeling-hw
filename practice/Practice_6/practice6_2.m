% Решение уравнений

function practice6_2()
    
    function dydx = equ(x, y)
        dydx = zeros(2,1);
        dydx(1) = y(2);
        dydx(2) = (2 + x) * y(1) + atan(x);
    end

    y0 = [0 1];
    tspan  = [0 3];
    [T,Y] = ode45(@equ,tspan, y0);
    plot(T,Y)

    % Решение ОДУ
    syms u(t) v(t)
    eqns = [diff(u,t,2) == v - 5 * u, diff(v,t,2) == 2 * v + u + t];
    conds = [u(0)==1.5, Du(0)==1, v(0)==3, Dv(0)==1];
    [uSol(t),vSol(t)] = dsolve(eqns, conds)
    %cond = ['u(0)==1.5','Du(0)==1','v(0)==3','Dv(0)==1'];
    %dsolve('D2u=v-5*u,D2v=2*v+u+t',cond)

end
