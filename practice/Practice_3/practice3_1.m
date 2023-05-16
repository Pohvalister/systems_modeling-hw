% Файл-сценарий для работы с 4 переменными

% Что нужно: Заданы четыре переменные, подсчитать количество равных нулю,
% положительных и отрицательных.
clear

nums = input('Введите числа для подсчёта через пробел: ', 's');

pos_counter = 0;
zer_counter = 0;
neg_counter = 0;

for num = str2double(strsplit(nums, ' '))
    if num > 0 
        pos_counter = pos_counter + 1;     
    elseif num < 0
        neg_counter = neg_counter + 1;
    else
        zer_counter = zer_counter + 1;
    end 
end

disp(['Введено: положительных - ', num2str(pos_counter), ...
    ', отрицательных - ', num2str(neg_counter), ...
    ', нулей - ', num2str(zer_counter)]);

if pos_counter + neg_counter + zer_counter ~= 4
    disp('Вы ввели не 4 числа!');
end
