% runOnLFW_Better.m
% LFW���ʵ����� - Ѱ�����Ż��Ĳ���

clear all;
% ��������       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dbName = 'LFWA';
scale = 0.5;
pathPrefix='../datasets/lfw-a/';
firstSample=imread('../datasets/lfw-a/Aaron_Eckhart/Aaron_Eckhart_0001.jpg');
halfSample =imresize(firstSample,scale); % ѹ����С
%[row col]=size(rgb2gray(halfSample));
[row col]=size(halfSample);
numOfSamples=30; % ȡ��5�������Ķ���
numOfClasses=0; % ���������Ҫͳ��
indiesOfClasses = []; % ��¼����λ��
% ������5������������
fileID = fopen('../datasets/lfw-names.txt');
namesAndImages = textscan(fileID,'%s %d');
fclose(fileID);
names = namesAndImages{1,1};
nums = namesAndImages{1,2};
[nRow, nCol] = size(names);
for jj=1:nRow % ������������
    numOfImages = nums(jj);
    if numOfImages >= numOfSamples  % ���������㹻
        numOfClasses = numOfClasses + 1;
        indiesOfClasses(numOfClasses)=jj;
    end
end

for cc=1:numOfClasses
    for ss=1:numOfSamples
        indexOfClass = indiesOfClasses(cc); %disp(indexOfClass);
        %path=[pathPrefix names(indexOfClass) '/' names(indexOfClass) '_' num2str(ss, '%04d') '.jpg'];
        path=strcat(pathPrefix,names(indexOfClass),'/',names(indexOfClass),'_',num2str(ss, '%04d'),'.jpg');
        colored=imread(path{1});
        %grayed=double(rgb2gray(colored));
        grayed=double(colored);
        inputData(cc,ss,:,:)= imresize(grayed(:,:),scale); % ѹ����С
    end
end
inputData=double(inputData); % all input data

% Setting Parameters   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

minTrains = 20;  % minimal number of training samples
maxTrains = 20;  % maximal number of training samples
%runWithNTrainings; % run with n training samples
%runWithRandomNTrainings2; % run with n training samples

% Cross validation
numOfParts = 5;
runWithNCrossValidation;

disp('Test done!');