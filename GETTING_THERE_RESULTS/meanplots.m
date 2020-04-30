close all
clear
clc

load('analyzedResults.mat')
f = [2178,2181,2185,2188,2192];
s11 = [];
s12 = [];
s21 = [];
s22 = [];
xlabeltext = '$f_{0}$ (in MHz)';
ylabeltext = 'mean gain difference';
myMat = abs(diffMeansMat);

%% S11 LINE
for k = 1:4:20
    s11 = [s11;myMat(k,:)];
end

%% S12 LINE
for k = 2:4:20
    s12 = [s12;myMat(k,:)];
end

%% S21 LINE
for k = 3:4:20
    s21 = [s21;myMat(k,:)];
end

%% S22 LINE
for k = 4:4:20
    s22 = [s22;myMat(k,:)];
end

%% PLOTTING S11
subplot(2,2,1)
plot(f,s11,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{11}$','interpreter','latex')
% hold on
% plot(f,zeros(size(f)))

%% PLOTTING S12
subplot(2,2,2)
plot(f,s12,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{12}$','interpreter','latex')
% hold on
% plot(f,zeros(size(f)))
leg1 = legend('$S(c=0.140,f_{0})-S(c=0.135,f_{0})$','$S(c=0.145,f_{0})-S(c=0.140,f_{0})$','$S(c=0.150,f_{0})-S(c=0.145,f_{0})$');
set(leg1,'interpreter','latex')

%% PLOTTING S21
subplot(2,2,3)
plot(f,s21,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{21}$','interpreter','latex')
% hold on
% plot(f,zeros(size(f)))

%% PLOTTING S22
subplot(2,2,4)
plot(f,s22,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{22}$','interpreter','latex')
% hold on
% plot(f,zeros(size(f)))