clear
close all
clc

load('simulationresults.mat')

matrixInpList = [Fr1950S11,Fr1950S12,Fr1950S21,Fr1950S22];
matrixInpList = [matrixInpList,Fr2000S11,Fr2000S12,Fr2000S21,Fr2000S22];
matrixInpList = [matrixInpList,Fr20533S11,Fr20533S12,Fr20533S21,Fr20533S22];

resGainDevMat = zeros(1,12);
resFreqDevMat = zeros(1,12);
diffMeansMat = zeros(12,3);
diffVarMat = zeros(12,3);
trendFollowMat = zeros(1,12);

for majorindex = 0 : 11
    matrixInp = matrixInpList(:,1+4*majorindex:4*(majorindex+1));
    [resGainDev,resFreqDev,diffMeans,diffVar,trendFollow] = analyzeMatrix(matrixInp,x);
    resGainDevMat(majorindex+1) = resGainDev;
    resFreqDevMat(majorindex+1) = resFreqDev;
    diffMeansMat(majorindex+1,:) = diffMeans;
    diffVarMat(majorindex+1,:) = diffVar;
    trendFollowMat(majorindex+1) = trendFollow;
end

save('analyzedResults.mat','resGainDevMat','resFreqDevMat','diffMeansMat','diffVarMat','trendFollowMat')

