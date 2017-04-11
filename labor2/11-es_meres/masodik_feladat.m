%adat beolvasasa
adat;

t=adat(:,1);
u=adat(:,2);
y=adat(:,3);
ts=t(2)-t(1);


%1.feladat - munkapont
% az elso 20 adatbol, mert ezek allandosult ertekek
y0=sum(y(1:20))/20
ym=y-y0;
u0=sum(u(1:20))/20
um=u-u0;



%2.feladat - atviteli fuggveny, idoallando, erosites
data=iddata(ym,um,ts);
model=arx(data,[1,1,1]);
[numd,dend]=th2tf(model);
Wpz=tf(numd,dend,ts);
Wps=d2c(Wpz)


A=dcgain(Wps)

%3.feladat - ugrasvalasz, lsim

figure(3)
step(Wps,'r')
ySim = lsim(Wps,u-u0,t)+y0;
figure(4)
plot(t,[ySim, adat(:,3)]);
title('Szimulalt es mert jel')


%4.feladat

dev=y-ySim;
atlag=sum(dev)/length(dev)
szoras=sqrt(sum((dev-atlag).^2)/length(dev))
