tic;
clc;
clear;
close;

%%in
data = csvread('data.csv', 1, 2);
data(data(:, 4) == 1, :) = [];
data(:, 4) = [];
data(:, [1 2])=data(:, [2 1]);
name = {"截距", "路程/km", "时间/h", "注重舒适程度", "可支配收入/RMB", "自付|家庭报销", "票价/RMB", "注重时间成本"};
order = string([name strcat(name{2}, strcat('*', name{6})) strcat(name{7}, strcat('*', name{8}))]');

%%process
[b bint r rint stats]=regress(data(:, 1), [ones(length(data(:, 1)), 1), data(:, 2), data(:, 3), data(:, 4), data(:, 5), data(:, 6), data(:, 7), data(:, 8), data(:, 2) .* data(:, 6), data(:, 7) .* data(:, 8)]);
[absb, pos] = sort(abs(b), 'descend');
B = b(pos, :);
order = order(pos, :);
order = [order num2str(B)];
order = [string((1:length(data(1, :)) + 2)') order];
xlswrite('order.xlsx', order);

%%in
data = csvread('data2.csv', 1, 2);
data(data(:, 4) == 1, :) = [];
data(:, 4) = [];
data(:, [1 2])=data(:, [2 1]);
data(:, 1) = 1;
scale = size(data);
data(:, scale(2) + 1) = data(:, 2) .* data(:, 6);
data(:, scale(2) + 2) = data(:, 7) .* data(:, 8);

%%process
y = data * b;
Y = string(num2str(y));
Y(y(:) >= .5)="高铁";
Y(y(:) < .5)="火车";
xlswrite('predict.xlsx', Y);

%%out
fprintf('Running time is %f second.\n', toc)

