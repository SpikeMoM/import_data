%% CST���ݵ���
point = 1003;
data_row = 5; %sweep������*��������S11��S21...����������������
data_col = 2; %һ��Ϊ2��Ƶ�ʡ����������߷���ͼΪ�������
for i = 1:data_row
    CST = dlmread('cst_test.txt','',[(i-1)*(point+3)+2 0 (i)*(point+3)-2 data_col-1]);
end
%% HFSS���ݵ���
point = 241;
data_row = 6; %sweep��������������������
data_col = 2; %ÿ��������Ҫ����Ĳ�����
HFSS = dlmread('hfss_test.txt','',[7 0 point+6 data_row*data_col]);
%% csv�ļ�ת��
% csvread('41.CSV', R1, C1, [R1 C1 R2 C2]); ����ȡ��ƫ���� R1 �� R2 ����ƫ���� C1 �� C2 �綨�ķ�Χ��
% һ��ʸ��csv����
VNA = csvread('VNA.CSV', 3, 0); 
save VNA.txt -ascii VNA