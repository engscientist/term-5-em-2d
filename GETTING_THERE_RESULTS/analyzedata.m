clear
close all
clc

load('simulationresults.mat')

matrixInpList = [Fr2178S11,Fr2178S12,Fr2178S21,Fr2178S22];
matrixInpList = [matrixInpList,Fr2181S11,Fr2181S12,Fr2181S21,Fr2181S22];
matrixInpList = [matrixInpList,Fr2185S11,Fr2185S12,Fr2185S21,Fr2185S22];
matrixInpList = [matrixInpList,Fr2188S11,Fr2188S12,Fr2188S21,Fr2188S22];
matrixInpList = [matrixInpList,Fr2192S11,Fr2192S12,Fr2192S21,Fr2192S22];

resGainDevMat = zeros(1,20);
resFreqDevMat = zeros(1,20);
diffMeansMat = zeros(20,3);
diffVarMat = zeros(20,3);
trendFollowMat = zeros(1,20);

for majorindex = 0 : 19
    matrixInp = matrixInpList(:,1+4*majorindex:4*(majorindex+1));
    [resGainDev,resFreqDev,diffMeans,diffVar,trendFollow] = analyzeMatrix(matrixInp,x);
    resGainDevMat(majorindex+1) = resGainDev;
    resFreqDevMat(majorindex+1) = resFreqDev;
    diffMeansMat(majorindex+1,:) = diffMeans;
    diffVarMat(majorindex+1,:) = diffVar;
    trendFollowMat(majorindex+1) = trendFollow;
end

save('analyzedResults.mat','resGainDevMat','resFreqDevMat','diffMeansMat','diffVarMat','trendFollowMat')

