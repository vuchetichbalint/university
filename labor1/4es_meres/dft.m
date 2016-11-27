t=[0:1:99];
negyszog=2*(sign(sign(50-t)-1)+0.5)
haromszog=[[0:1:50],[49:-1:1]]./50
furesz=[0:1:99]./99
szinusz=sin(2*pi/100*t)
k=[0:1:9];

negyszog_spektrum = abs(negyszog*exp(2*pi*i/100*transpose(t)*k));
haromszog_spektrum = abs(haromszog*exp(2*pi*i/100*transpose(t)*k));
furesz_spektrum = abs(furesz*exp(2*pi*i/100*transpose(t)*k));
szinusz_spektrum = abs(szinusz*exp(2*pi*i/100*transpose(t)*k))


