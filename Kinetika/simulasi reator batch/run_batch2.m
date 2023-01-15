function run_batch2
clc,clear
[t,Y]=ode23(@rbatch_2,[0 50],[0.5 500])
[t Y]
plot(t,Y(:,1),'-+r')
title('konsentrasi dalam rekator')
xlabel('waktu (min)')
ylabel('Ca(mol/L)')
pause
plot(t,Y(:,2),'-ob')
title('suhu dalam reaktor')
xlabel('waktu (min)')
ylabel('T(L)')
%---------------------------------------------
function dcdt=rbatch_2(t,Y)
%menghitung fngsu ruas kana dari persamaan neraca massa reakor
Ca=Y(1);
T=Y(2);
dcdt(1)=-1E8*exp(-95000/(8.314*T))*Ca/(1.03+Ca);
dcdt(2)=1E8*exp(-95000/(8.314*T))*Ca/(1.03+Ca)*(432*1000)/(1000*4.3);
dcdt=dcdt'
