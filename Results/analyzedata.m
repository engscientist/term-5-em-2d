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

for majorindex = 0 : 15
    matrixInp = matrixInpList(:,1+4*majorindex:4*(majorindex+1));
    [resFreq,resGain,resGainDev,resFreqDev] = analyzeMatrix(matrixInp,x);
    resGainDevMat(majorindex+1) = resGainDev;
    resFreqDevMat(majorindex+1) = resFreqDev;
end




