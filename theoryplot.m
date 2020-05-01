close all
%% CONCENTRATION OF SODIUM CHLORIDE IN SOLUTION
c = [130:155] / 1000;

%% RELATIVE PERMITTIVITY MODEL
modelepsilonwater = 78.3;
modelalpha = 11.7;
modelepsilonrelative = modelepsilonwater - modelalpha .* c;

%% CONDUCTIVITY MODEL
modelsigma = (0.1673 .* c + 2.3381) / 10;

%% RELATIVE PERMEABILITY
murelative = 0.999991;

%% MEDIUM
mediumz = 2.3 / 1000;

%% POWER DENSITY EQUATION
% SCALARS
epsilonvacuum = (1 / (36 * pi)) * (10 ^ (-9));
muvacuum = 4 * pi * (10 ^ (-7));
% VECTORS
f = 2185 * (10 ^ 6);
angfreq = 2 * pi * f;
PARTA1 = sqrt(murelative * muvacuum ./ (modelepsilonrelative .* epsilonvacuum));
PARTA2 = (1 + ((modelsigma ./ (angfreq .* modelepsilonrelative .* epsilonvacuum)) .^ 2)) .^ (-1 / 4);
PARTA = 1 ./ (2 .* PARTA1 .* PARTA2);
PARTB11 = murelative .* muvacuum .* modelepsilonrelative .* epsilonvacuum ./ 2;
PARTB12 = sqrt(1 + (modelsigma ./ (angfreq .* modelepsilonrelative .* epsilonvacuum)) .^ 2) - 1;
PARTB1 = sqrt(PARTB11 .* PARTB12);
PARTB = exp(-2 .* angfreq .* mediumz .* PARTB1);
PARTC1 = modelsigma ./ (angfreq .* modelepsilonrelative .* epsilonvacuum);
PARTC = cos((1 / 2) .* atan(PARTC1));
x = c;
y = PARTA .* PARTB .* PARTC;
plot(x,y,'LineWidth',1.25)

xlabeltext = '[NaCl] (in mol/L)';
ylabeltext = '$S(f:c,f_{0})$';
xlab = xlabel(xlabeltext,'interpreter','latex');
ylab = ylabel(ylabeltext,'interpreter','latex');
tit = title('Plot of $S(f:c,f_{0})$ against [NaCl] (in mol/L)','interpreter','latex');
set(tit,'FontSize',14)
set(xlab,'FontSize',14)
set(ylab,'FontSize',14)
set(gca,'FontSize',12)