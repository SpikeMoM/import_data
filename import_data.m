%% CST数据导入
% method 1
point = 1003;
data_row = 5; %sweep的数量*参量数（S11、S21...），参数纵向排列
data_col = 2; %一般为2：频率、参量，天线方向图为多个参量
for i = 1:data_row
    CST1(1+(i-1)*point:i*point, :) = dlmread('cst_test.txt','',[(i-1)*(point+3)+2 0 (i)*(point+3)-2 data_col-1]);
end
% method 2
num = 8;
CST2 = zeros(point, num+1);
for i = 1:8
    if i == 1
        %读取频率+第一列参数
        CST2(1:point, 1:2) = dlmread('Real.txt','',[(i-1)*(point+3)+2 0 (i)*(point+3)-2 1]);
    else
        %第一列之后的参数
        CST2(1:point, i+1) = dlmread('Real.txt','',[(i-1)*(point+3)+2 1 (i)*(point+3)-2 1]);
    end
end
%% HFSS数据导入
point = 241;
data_row = 6; %sweep的数量，参数横向排列
data_col = 2; %每个仿真需要导入的参数量
HFSS = dlmread('hfss_test.txt','',[7 0 point+6 data_row*data_col]);
%% csv文件转换
% csvread('41.CSV', R1, C1, [R1 C1 R2 C2]); 仅读取行偏移量 R1 和 R2 及列偏移量 C1 和 C2 界定的范围。
% 一般矢网csv数据
VNA = csvread('VNA.CSV', 3, 0); 
save VNA.txt -ascii VNA