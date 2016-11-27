a=[1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0];
b=[0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 0.875 0.75 0.625 0.5 0.375 0.25 0.125];
c=[0 0.0667 0.1333 0.2 0.2667 0.3333 0.4 0.4667 0.5333 0.6 0.6667 0.7333 0.8 0.8667 0.9333 1];
d=[0 0.3827 0.7071 0.9239 1 0.9239 0.7071 0.3827 0 -0.3827 -0.7071 -0.9239 -1 -0.9239 -0.7071 -0.3829];

Fs=1; 			% Mintaveteli frekvencia: egysegnyi
T=1/Fs; 		% Mintaveteli ido
L=16; 			% Mintasorozat hossza
t=(0:L-1)*T; 	% Idovektor

f=Fs/2*linspace(0,1,L/2+1);  % Frekvenciatengely definialasa az amplitudospektrum abrazolasahoz


% ---- Negyszog ----
% Az idofuggveny abrazolasa
stem(Fs*t(1:16),a(1:16)); grid
title('A negyszogjel idofuggvenyenek egy periodusa.')
xlabel('t [s]')
ylabel('x_a(t)')
pause

% A Fourier-transzformacio elvegzese
A = fft(a)/L;
% A "feloldalas" amplitudo-spektrum abrazolasa
stem(f,2*abs(A(1:L/2+1))); grid
title('A negyszogjel "feloldalas" amplitudo-spektruma.')
xlabel('f [Hz]')
ylabel('|X_a(f)|')
pause

% ---- Haromszog ----
% Az idofuggveny abrazolasa
stem(Fs*t(1:16),b(1:16)); grid
title('A haromszogjel idofuggvenyenek egy periodusa.')
xlabel('t [s]')
ylabel('x_b(t)')
pause

% A Fourier-transzformacio elvegzese
B = fft(b)/L;
% A "feloldalas" amplitudo-spektrum abrazolasa
stem(f,2*abs(B(1:L/2+1))); grid
title('A haromszogjel "feloldalas" amplitudo-spektruma.')
xlabel('f [Hz]')
ylabel('|X_b(f)|')
pause

% ---- Furesz ----
% Az idofuggveny abrazolasa
stem(Fs*t(1:16),c(1:16)); grid
title('A fureszjel idofuggvenyenek egy periodusa.')
xlabel('t [s]')
ylabel('x_c(t)')
pause

% A Fourier-transzformacio elvegzese
C = fft(c)/L;
% A "feloldalas" amplitudo-spektrum abrazolasa
stem(f,2*abs(C(1:L/2+1))); grid
title('A fureszjel "feloldalas" amplitudo-spektruma.')
xlabel('f [Hz]')
ylabel('|X_c(f)|')
pause

% ---- Sinus ----
% Az idofuggveny abrazolasa
stem(Fs*t(1:16),d(1:16)); grid
title('A sinus-jel idofuggvenyenek egy periodusa.')
xlabel('t [s]')
ylabel('x_d(t)')
pause

% A Fourier-transzformacio elvegzese
D = fft(d)/L;
% A "feloldalas" amplitudo-spektrum abrazolasa
stem(f,2*abs(D(1:L/2+1))); grid
title('A sinus-jel "feloldalas" amplitudo-spektruma.')
xlabel('f [Hz]')
ylabel('|X_d(f)|') 
