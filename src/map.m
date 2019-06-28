tic;
clc;
clear;
close;

%%in

%% 载入地图数据
sheng=shaperead('bou2_4p.shp', 'UseGeoCoords', true);% 省
%% 使用importdata向导导入2011年全国31个省的数据
d=importdata('ratio.csv', ',');
d.textdata(1, :)=[];
d.textdata(:, 2)=[];
data=d.data;
textdata=d.textdata; % 相对应的省的名称

%%process
%% 定义地图参数
% 针对不同省份，分别设置不同的颜色（FaceColor）
% 定义颜色
k=128;
mycolormap=summer(k);
% 生成不同区域按大小的颜色，按照人口数目多少分别指定不同的颜色
% 人口越多，颜色越突出
geoname={sheng.NAME}';
max_data = max(data);
n=length(data);
mysymbolspec=cell(1,n); % 预定义变量可以加快处理速度
for i=1:n
	count=data(i);
	mycoloridx=floor( k * count / max_data );
	mycoloridx(mycoloridx<1)=1;
	myprovince=textdata{i};
	geoidx=strmatch(myprovince, geoname);
	if numel(geoidx) > 0
		province_name=geoname( geoidx(1) );
		mysymbolspec{i} = {'NAME', char(province_name), 'FaceColor', mycolormap( mycoloridx, :) };
	end
end
%% 显示地图
figure
ax=worldmap('china'); % 使用worldmap的坐标轴作图
setm(ax,'grid','off') % 关闭grid
setm(ax,'frame','off') % 关闭边框
setm(ax,'parallellabel','off') % 关闭坐标轴标记
setm(ax,'meridianlabel','off') % 关闭坐标轴标记

% 最关键的两个语句
symbols=makesymbolspec('Polygon',{'default','FaceColor',[0.9 0.9 0.8], 'LineStyle','--','LineWidth',0.2, 'EdgeColor',[0.8 0.9 0.9]}, mysymbolspec{:});
geoshow(sheng,'SymbolSpec',symbols); % 此处用mapshow投影会不正确

%% 图的标注
% 在图像右侧显示bar
colormap(summer(k));
hcb=colorbar('EastOutside');
step=round(max_data/11);
set(hcb,'YTick',(0:.1:1));
set(hcb,'YTickLabel',num2cell(0:step:max_data));

% 给图像加标题
title('中国各省高铁乘客人数/火车乘客人数');

%%out
fprintf('Running time is %f second.\n', toc)

