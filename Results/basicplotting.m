xlabeltext = '$f$ (in MHz)';
ylabeltext = '$S(f:c,f_{0})$';
plot(x,Fr2350S12)
xlab = xlabel(xlabeltext,'interpreter','latex');
ylab = ylabel(ylabeltext,'interpreter','latex');
tit = title('Plot of $\sigma_{s}(f_{0})$ against $f_{0}$','interpreter','latex');
tit = title('Plot of $S(f:c,f_{0})$ against $f$ (in MHz)','interpreter','latex');
leg1 = legend('$c=0.135$ mmol/L','$c=0.140$ mmol/L','$c=0.145$ mmol/L','$c=0.150$ mmol/L');
set(leg1,'interpreter','latex')
set(tit,'FontSize',14)
set(xlab,'FontSize',14)
set(ylab,'FontSize',14)
set(leg1,'FontSize',14)
set(gca,'FontSize',12)



