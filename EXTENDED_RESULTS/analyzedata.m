clear
close all
clc

load('simulationresults.mat')

matrixInpList = [Fr2192S11,Fr2192S12,Fr2192S21,Fr2192S22];
matrixInpList = [matrixInpList,Fr2206S11,Fr2206S12,Fr2206S21,Fr2206S22];
matrixInpList = [matrixInpList,Fr2220S11,Fr2220S12,Fr2220S21,Fr2220S22];
matrixInpList = [matrixInpList,Fr2235S11,Fr2235S12,Fr2235S21,Fr2235S22];

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

