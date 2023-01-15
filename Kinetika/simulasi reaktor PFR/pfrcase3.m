function pfrcase2
clc,clear
vspan=[0 0.001];
Y0=[0 1035 1250];
[v,Y]=ode45(@reactorcase2,vspan,Y0);
plot(v,Y(:,1),'-r')
title('konversi reaktor')
xlabel('volume, m^3')
ylabel('konversi reaktor')
pause
plot(v,Y(:,2),'-b',v,Y(:,3),'-m')
title('profil temperature reaktorr')
xlabel('volume reaktor, m^3')
ylabel('temperature, K')
legend('Reaktor,T','Pemanas,Ta')
%------------------------------------
function dYdv=reactorcase2(v,Y)
x=Y(1);
T=Y(2);
Ta=Y(3);
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
Ua=1.65E+4;
mc=0.111;
Cpc=34.5;
DHrxn0=80770;%J/mol
CpA=26.63+0.183*T-45.86E-6*T^2;
CpB=20.04+0.0945*T-30.95E-6*T^2;
CpC=13.39+0.077*T-18.71E-6*T^2;
k=8.2E14*exp(-34222/T);
ra=-k*CA0*(1-x)*(T0/T)/(1+x);
DHrxn=DHrxn0+Da*(T-Tr)+(Db/2)*(T^2-Tr^2)+(Dc/3)*(T^3-Tr^3);
dYdv(1)=-ra/FA0;
dYdv(2)=(Ua*(Ta-T)+ra*(DHrxn))/(FA*CpA+FB*CpB+FC*CpC);
dYdv(3)=Ua*(T-Ta)/(mc*Cpc);
dYdv=dYdv'