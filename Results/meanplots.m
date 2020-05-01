close all
clear
clc

load('analyzedResults.mat')
f = [2120;2178;2293;2350];
s11 = [];
s12 = [];
s21 = [];
s22 = [];
xlabeltext = '$f_{0}$ (in MHz)';
ylabeltext = '$\sigma_{s}\left(f_{0}\right)$';
myMat = abs(diffVarMat);

%% S11 LINE
for k = 1:4:16
    s11 = [s11;myMat(k,:)];
end

%% S12 LINE
for k = 2:4:16
    s12 = [s12;myMat(k,:)];
end

for k = 2:4:15
    s12 = []

%% S21 LINE
for k = 3:4:16
    s21 = [s21;myMat(k,:)];
end

%% S22 LINE
for k = 4:4:16
    s22 = [s22;myMat(k,:)];
end

%% PLOTTING S11
% subplot(2,2,1)
% plot(f,s11,'-x')
% xlabel(xlabeltext,'interpreter','latex')
% ylabel(ylabeltext,'interpreter','latex')
% title('$S_{11}$','interpreter','latex')
% hold on
% plot(f,zeros(size(f)))

%% PLOTTING S12
subplot(1,2,1)
plot(f,s12,'-x','LineWidth',1.25)
xlab = xlabel(xlabeltext,'interpreter','latex');
ylab = ylabel(ylabeltext,'interpreter','latex');
tit = title('Plot of $\sigma_{s}(f_{0})$ against $f_{0}$','interpreter','latex');
% hold on
% plot(f,zeros(size(f)))
leg1 = legend('$\sigma_{s_1}$','$\sigma_{s_2}$','$\sigma_{s_3}$');
set(leg1,'interpreter','latex')
set(tit,'FontSize',14)
set(xlab,'FontSize',14)
set(ylab,'FontSize',14)
set(leg1,'FontSize',14)
set(gca,'FontSize',12)

%% PLOTTING S21
% subplot(2,2,3)
% plot(f,s21,'-x')
% xlabel(xlabeltext,'interpreter','latex')
% ylabel(ylabeltext,'interpreter','latex')
% title('$S_{21}$','interpreter','latex')
% hold on
% plot(f,zeros(size(f)))

%% PLOTTING S22
% subplot(2,2,4)
% plot(f,s22,'-x')
% xlabel(xlabeltext,'interpreter','latex')
% ylabel(ylabeltext,'interpreter','latex')
% title('$S_{22}$','interpreter','latex')
% hold on
% plot(f,zeros(size(f)))