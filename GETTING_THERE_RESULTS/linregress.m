close all
clear
clc

load('analyzedResults.mat')
x = transpose([2178,2181,2185,2188,2192]);

myMat = abs(diffMeansMat) - 3 * sqrt(diffVarMat);
s12 = [];
for k = 2:4:20
    s12 = [s12;myMat(k,:)];
end

y = s12(:,1);

xlen = length(x);

X = [ones(xlen,1),x,x.^2];

M = inv(transpose(X)*X) * transpose(X) * y;

xval = transpose(min(x):max(x));
xmat = [ones(size(xval)),xval,xval.^2];
yval = xmat * M;
plot(xval,yval)
hold on
plot(x,y,'x')

performance = sum((y-X*M).^2);