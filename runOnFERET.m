% runOnGT_Better.m
% GT���ʵ����� - Ѱ�����Ż��Ĳ���

clear all;
% ��������       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dbName = 'FERET';
pathPrefix='../datasets/feret/';
firstSample=imread('../datasets/feret/1.tif');
[row col]=size(firstSample);
numOfSamples=7;
numOfClasses=200;

for cc=1:numOfClasses
    for ss=1:numOfSamples
        path=[pathPrefix num2str((cc-1)*numOfSamples+ss,'%d') '.tif'];
        inputData(cc,ss,:,:)=imread(path);
    end
end
inputData=double(inputData); % all input data

% Setting Parameters   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

minTrains = 6;  % minimal number of training samples
maxTrains = 6;  % maximal number of training samples
%runWithNTrainings; % run with n training samples
runWithRandomNTrainings; % run with n training samples

% Cross validation
numOfParts = 3;
%runWithNCrossValidation;

disp('Test done!');