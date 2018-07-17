% runOnCOIL_Better.m
% COIL���ʵ����� - Ѱ�����Ż��Ĳ���

clear all;
% ��������       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           
dbName = 'COIL';
pathPrefix='../datasets/coil-20-proc/';
firstSample=imread('../datasets/coil-20-proc/obj1__0.png');
[row col]=size(firstSample);
numOfSamples=30;%72;
numOfClasses=20;

for cc=1:numOfClasses
    for ss=1:numOfSamples
        path=[pathPrefix 'obj' num2str(cc, '%d') '__' num2str(ss-1, '%d') '.png'];
        inputData(cc,ss,:,:)=imread(path);
    end
end
inputData=double(inputData); % ���е���������

% Setting Parameters   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

minTrains = 4;  % minimal number of training samples
maxTrains = 4;  % maximal number of training samples
runWithNTrainings; % run with n training samples

disp('Test done!');