close all
clear
clc

load('compareMATCHING.mat')
f = [2120;2178;2293;2350];
s11 = [];
s12 = [];
s21 = [];
s22 = [];
s11m = [];
s12m = [];
s21m = [];
s22m = [];
xlabeltext = '$f_{0}$ (in MHz)';
ylabeltext = 'min $|\mu|-3\sigma$';
myMatt = diffCritMatt;
myMattM = diffCritMattM;

%% S11 LINE
for k = 1:4:16
    s11 = [s11;myMatt(k,:)];
    s11m = [s11m;myMattM(k,:)];
end

%% S12 LINE
for k = 2:4:16
    s12 = [s12;myMatt(k,:)];
    s12m = [s12m;myMattM(k,:)];
end

%% S21 LINE
for k = 3:4:16
    s21 = [s21;myMatt(k,:)];
    s21m = [s21m;myMattM(k,:)];
end

%% S22 LINE
for k = 4:4:16
    s22 = [s22;myMatt(k,:)];
    s22m = [s22m;myMattM(k,:)];
end

%% PLOTTING S11
subplot(2,2,1)
plot(f,s11,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{11}$','interpreter','latex')
hold on
plot(f,s11m,'-x')
% plot(f,zeros(size(f)))

%% PLOTTING S12
subplot(2,2,2)
plot(f,s12,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{12}$','interpreter','latex')
hold on
plot(f,s12m,'-x')
% plot(f,zeros(size(f)))
leg1 = legend('without matching','with matching');

%% PLOTTING S21
subplot(2,2,3)
plot(f,s21,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{21}$','interpreter','latex')
hold on
plot(f,s21m,'-x')
% plot(f,zeros(size(f)))

%% PLOTTING S22
subplot(2,2,4)
plot(f,s22,'-x')
xlabel(xlabeltext,'interpreter','latex')
ylabel(ylabeltext,'interpreter','latex')
title('$S_{22}$','interpreter','latex')
hold on
plot(f,s22m,'-x')
% plot(f,zeros(size(f)))