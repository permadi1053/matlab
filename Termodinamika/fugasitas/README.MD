Cara menggunakan solver.
ubah directory pada folder solver
masukkan parameter berikut:
Tc = 308.3; Pc = 61.39; w = 0.187; T = 250; P = 10; eos = 'srk'; state = 'v';
lalu tekan enter
masukkan perinta berikut:
[phig f] = phigas(state,eos,T,P,Tc,Pc,w)
