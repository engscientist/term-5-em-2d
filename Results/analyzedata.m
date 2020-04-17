clear
close all
clc

load('simulationresults.mat')

matrixInpList = [Fr2120S11,Fr2120S12,Fr2120S21,Fr2120S22];
matrixInpList = [matrixInpList,Fr2178S11,Fr2178S12,Fr2178S21,Fr2178S22];
matrixInpList = [matrixInpList,Fr2293S11,Fr2293S12,Fr2293S21,Fr2293S22];
matrixInpList = [matrixInpList,Fr2350S11,Fr2350S12,Fr2350S21,Fr2350S22];

resGainDevMat = zeros(1,16);
resFreqDevMat = zeros(1,16);
diffMeansMat = zeros(16,3);
diffVarMat = zeros(16,3);
trendFollowMat = zeros(1,16);

for majorindex = 0 : 15
    matrixInp = matrixInpList(:,1+4*majorindex:4*(majorindex+1));
    [resGainDev,resFreqDev,diffMeans,diffVar,trendFollow] = analyzeMatrix(matrixInp,x);
    resGainDevMat(majorindex+1) = resGainDev;
    resFreqDevMat(majorindex+1) = resFreqDev;
    diffMeansMat(majorindex+1,:) = diffMeans;
    diffVarMat(majorindex+1,:) = diffVar;
    trendFollowMat(majorindex+1) = trendFollow;
end

save('analyzedResults.mat','resGainDevMat','resFreqDevMat','diffMeansMat','diffVarMat','trendFollowMat')

