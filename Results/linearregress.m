close all
clear
clc

load('analyzedResults.mat')
x = [2120;2178;2293;2350];

myMat = abs(diffMeansMat) - 3 * sqrt(diffVarMat);
s12 = [];
for k = 2:4:16
    s12 = [s12;myMat(k,:)];
end

y = s12(:,1);

xlen = length(x);

X = [ones(xlen,1),x,x.^2,x.^3];

M = inv(transpose(X)*X) * transpose(X) * y;

xval = transpose(min(x):max(x));
xmat = [ones(size(xval)),xval,xval.^2,xval.^3];
yval = xmat * M;
plot(xval,yval)
hold on
plot(x,y,'x')