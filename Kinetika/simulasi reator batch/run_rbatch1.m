function run_rbatch1
clc,clear
tspan=[0:1:10] %interval waktu dari 0 sampai 10 dengan increment 1
%eksekusi persamaan differensial
[t,Ca]=ode45(@rbatch,tspan,0.5);
[t,Ca] %untuk menampilkan t danCa dalam baris yang sama
plot(t,Ca(:,1),'-ob')
title('perubahan konsentrasi terhadap waktu')
xlabel('waktu(menit)')
ylabel('konsentrasi')
%-----------------------------------------------------------------------
function dcdt=rbatch(t,Ca)
%ntuk menghitung fungsi ruas kanan dari persamaan neraca massa reaktor batch
dcdt=-(0.1*Ca/(1.03+Ca));
dcdt=dcdt';
