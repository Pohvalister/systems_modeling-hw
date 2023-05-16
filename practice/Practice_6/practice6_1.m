% Работа с табличными функциями

X = 0:7;
Y = [1, 2.5, 7, 14.5, 25, 38.5, 55, 74.5];

x = linspace(0, 7);

yi = interp1(X,Y,x);
%plot(X, Y, 'o', x, yi);
    
p = polyfit(X, Y, 3);
plot(X,Y, 'o', x, polyval(p,x), 'g', x, yi); % poly более гладкая

