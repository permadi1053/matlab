function pfrcase1
clc,clear
vspan=[0 0.005];
Y0=[0 1035];
[v,Y]=ode45(@reactorcase1,vspan,Y0);
subplot(2,1,1)
plot(v,Y(:,1),'-r')
title('konversi reaktor')
xlabel('volume, m^3')
subplot(2,1,2)
plot(v,Y(:,2),'-b')
title('tempretarure reaktr, K')
xlabel('volume reaktor, m^3')
%------------------------------------
function dYdv=reactorcase1(v,Y)
x=Y(1);
T=Y(2);
CA0=18.85;%mol/m^3
Da=6.8;%delta a
Db=-(5.75E-3)*2;%delta b
Dc=-(1.27E-6)*3;%delta c
FA0=0.03754;%mol/s
T0=1035;
Tr=298;
FA=FA0*(1-x);
FB=FA0*x;
FC=FA0*x;
DHrxn0=80770;%J/mol
CpA=26.63+0.183*T-45.86E-6*T^2;
CpB=20.04+0.0945*T-30.95E-6*T^2;
CpC=13.39+0.077*T-18.71E-6*T^2;
k=8.2E14*exp(-34222/T);
ra=-k*CA0*(1-x)*(T0/T)/(1+x);
DHrxn=DHrxn0+Da*(T-Tr)+(Db/2)*(T^2-Tr^2)+(Dc/3)*(T^3-Tr^3);
dYdv(1)=-ra/FA0;
dYdv(2)=-ra*(-DHrxn)/(FA*CpA+FB*CpB+FC*CpC);
dYdv=dYdv'