close all
clear
clc

load('analyzedResults.mat')
load('analyzedResultsMATCHED.mat')

f = [2120;2178;2293;2350];

diffMeansMatM = [diffMeansMatM(1:8,:);diffMeansMatM(13:20,:)];
diffVarMatM = [diffVarMatM(1:8,:);diffVarMatM(13:20,:)];

diffMeansMatt = min(abs(diffMeansMat),[],2);
diffVarMatt = max(diffVarMat,[],2);
diffMeansMattM = min(abs(diffMeansMatM),[],2);
diffVarMattM = max(diffVarMatM,[],2);
diffCritMatt = min(abs(diffMeansMat)-3*sqrt(diffVarMat),[],2);
diffCritMattM = min(abs(diffMeansMatM)-3*sqrt(diffVarMatM),[],2);


icounter = 1;
rcounter = 1;

save('compareMATCHING.mat','diffMeansMattM','diffMeansMatt','diffVarMattM','diffVarMatt','diffCritMatt','diffCritMattM')






