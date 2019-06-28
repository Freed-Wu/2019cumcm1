tic;
clc;
clear;
close;

%%in
data = csvread('data.csv', 1, 2);
data(data(:, 4) == 1, :) = [];
data(:, 4) = [];
data(:, [1 2])=data(:, [2 1]);
name = {"高铁|火车", "路程/km", "时间/h", "注重舒适程度", "可支配收入/RMB", "自付|家庭报销", "票价/RMB", "注重时间成本"};
numClust = 2;

%%process
d=1-abs(corrcoef(data));  %进行数据变换，把相关系数转化为距离
d=tril(d);   %提出d矩阵的下三角部分
d=nonzeros(d); %去掉d中的0元素
z=linkage(d','complete');  %按最长距离法聚类
y=cluster(z,'maxclust',numClust);
for i = 1:numClust
	clust{i}={name{y(:)==i}};
end
h=dendrogram(z);  %画聚类图
set(h,'Color','k','LineWidth',2.0);%把聚类图线的颜色修改成黑色，线宽加粗
xtick = get(gca,'Xticklabel');
Xtick = cell(1, length(xtick));
for i = 1:length(xtick)
	Xtick{xtick(:)==num2str(i)}=name{i};
end
set(gca,'Xticklabel', Xtick);

%%out
fprintf('Running time is %f second.\n', toc)

