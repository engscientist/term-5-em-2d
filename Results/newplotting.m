close all
clear
clc

load('analyzedResults.mat')
f = [2120;2178;2293;2350];
xlabeltext = '$f_{0}$ (in MHz)';

myMat = abs(diffMeansMat);
myMat1 = diffVarMat;
myMat2 = abs(diffMeansMat) - 3*sqrt(diffVarMat);
s12mean = [];
s12var = [];
s12f = [];

%% S12 LINE
for k = 2:4:15
    s12mean = [s12mean;myMat(k,:)];
    s12var = [s12var;myMat1(k,:)];
    s12f = [s12f;myMat2(k,:)];
end

%% PLOTTING S12
subplot(2,2,1)
ylabeltext = '$\overline{s}(f_{0})$';
plot(f,s12mean,'-x','LineWidth',1.25)
xlab = xlabel(xlabeltext,'interpreter','latex');
ylab = ylabel(ylabeltext,'interpreter','latex');
tit = title('Plot of $\overline{s}(f_{0})$ against $f_{0}$','interpreter','latex');
% hold on
% plot(f,zeros(size(f)))
set(tit,'FontSize',14)
set(xlab,'FontSize',14)
set(ylab,'FontSize',14)
set(gca,'FontSize',12)
leg1 = legend('$\overline{s}_{1}$','$\overline{s}_{2}$','$\overline{s}_{3}$');
set(leg1,'interpreter','latex')
set(leg1,'FontSize',14)

subplot(2,2,2)
ylabeltext = '${\sigma_{s}(f_{0})}^{2}$';
plot(f,s12var,'-x','LineWidth',1.25)
xlab = xlabel(xlabeltext,'interpreter','latex');
ylab = ylabel(ylabeltext,'interpreter','latex');
tit = title('Plot of $[{\sigma_{s}(f_{0})}]^{2}$ against $f_{0}$','interpreter','latex');
% hold on
% plot(f,zeros(size(f)))
set(tit,'FontSize',14)
set(xlab,'FontSize',14)
set(ylab,'FontSize',14)
set(gca,'FontSize',12)
leg1 = legend('$\sigma_{s_1}$','$\sigma_{s_2}$','$\sigma_{s_3}$');
set(leg1,'interpreter','latex')
set(leg1,'FontSize',14)

subplot(2,2,[3,4])
ylabeltext = '$|\overline{s}(f_{0})|-3\sigma_{s}(f_{0})$';
plot(f,s12f,'-x','LineWidth',1.25)
hold on
plot(f,zeros(size(f)),'-','LineWidth',1.25)
xlab = xlabel(xlabeltext,'interpreter','latex');
ylab = ylabel(ylabeltext,'interpreter','latex');
tit = title('Plot of $|\overline{s}(f_{0})|-3\sigma_{s}(f_{0})$ against $f_{0}$','interpreter','latex');
% hold on
% plot(f,zeros(size(f)))
set(tit,'FontSize',14)
set(xlab,'FontSize',14)
set(ylab,'FontSize',14)
set(gca,'FontSize',12)
set(leg1,'FontSize',14)
leg1 = legend('$s_1$','$s_2$','$s_3$','$y=0$');
set(leg1,'interpreter','latex')
set(leg1,'FontSize',14)