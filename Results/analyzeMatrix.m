function [resFreq,resGain,resGainDev,resFreqDev] = analyzeMatrix(matrixInp,x)
resGain = zeros(1,4);
c135 = matrixInp(:,1);
c140 = matrixInp(:,2);
c145 = matrixInp(:,3);
c150 = matrixInp(:,4);
[resGain(1),c135Index] = min(c135);
[resGain(2),c140Index] = min(c140);
[resGain(3),c145Index] = min(c145);
[resGain(4),c150Index] = min(c150);
resFreq = [x(c135Index),x(c140Index),x(c145Index),x(c150Index)];
resGainDev = sqrt(var(resGain)) * correctValFunc(resGain);
resFreqDev = sqrt(var(resFreq)) * correctValFunc(resFreq);
end

