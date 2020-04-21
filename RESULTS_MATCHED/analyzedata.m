clear
close all
clc

load('simulationresults_MATCHED.mat')

matrixInpList = [Fr2120S11M,Fr2120S12M,Fr2120S21M,Fr2120S22M];
matrixInpList = [matrixInpList,Fr2177S11M,Fr2177S12M,Fr2177S21M,Fr2177S22M];
matrixInpList = [matrixInpList,Fr2235S11M,Fr2235S12M,Fr2235S21M,Fr2235S22M];
matrixInpList = [matrixInpList,Fr2292S11M,Fr2292S12M,Fr2292S21M,Fr2292S22M];
matrixInpList = [matrixInpList,Fr2350S11M,Fr2350S12M,Fr2350S21M,Fr2350S22M];

resGainDevMatM = zeros(1,20);
resFreqDevMatM = zeros(1,20);
diffMeansMatM = zeros(20,3);
diffVarMatM = zeros(20,3);
trendFollowMatM = zeros(1,20);

for majorindex = 0 : 19
    matrixInp = matrixInpList(:,1+4*majorindex:4*(majorindex+1));
    [resGainDev,resFreqDev,diffMeans,diffVar,trendFollow] = analyzeMatrix(matrixInp,x);
    resGainDevMatM(majorindex+1) = resGainDev;
    resFreqDevMatM(majorindex+1) = resFreqDev;
    diffMeansMatM(majorindex+1,:) = diffMeans;
    diffVarMatM(majorindex+1,:) = diffVar;
    trendFollowMatM(majorindex+1) = trendFollow;
end

save('analyzedResultsMATCHED.mat','resGainDevMatM','resFreqDevMatM','diffMeansMatM','diffVarMatM','trendFollowMatM')

