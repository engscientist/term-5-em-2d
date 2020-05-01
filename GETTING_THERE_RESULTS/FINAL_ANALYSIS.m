clc
clear
close all

load simulationresultsFINAL.mat

data2185 = [Fr2185S12(:,1)-Fr2185S12(:,2),Fr2185S12(:,2)-Fr2185S12(:,3),Fr2185S12(:,3)-Fr2185S12(:,4)];

mean2185 = abs(mean(data2185));
var2185 = var(data2185);

data2186 = [Fr2186S12(:,1)-Fr2186S12(:,2),Fr2186S12(:,2)-Fr2186S12(:,3),Fr2186S12(:,3)-Fr2186S12(:,4)];

mean2186 = abs(mean(data2186));
var2186 = var(data2186);




