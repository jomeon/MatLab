clear; clc ;close all

%% Kod
% Tworzenie przybliżenia liczby π metodą MonteCarlo
N=1000;
N2=100;
N3=10000;

R = 1. ;
C = [0. 0.] ;
th = 90:-1:0 ;
xc = C(1)+R*cosd(th) ;
yc = C(2)+R*sind(th) ;
subplot(2,3,1)
hold on;
plot(xc,yc,'g');
hold on;
[x,y,inside,outside,pii] = montecarlo(N);
title({'N=1000'},pii);
plot(x(inside),y(inside),'b.');
hold on;
plot(x(outside),y(outside),'r.');
hold on;
%N2
R = 1. ;
C = [0. 0.] ;
th = 90:-1:0 ;
xc = C(1)+R*cosd(th) ;
yc = C(2)+R*sind(th) ;
subplot(2,3,2);
hold on;
plot(xc,yc,'g')
hold on;
[x,y,inside,outside,pii] = montecarlo(N2);
title({'N=100'},pii);
plot(x(inside),y(inside),'b.');
hold on;
plot(x(outside),y(outside),'r.');
hold off;
%N3
R = 1. ;
C = [0. 0.] ;
th = 90:-1:0 ;
xc = C(1)+R*cosd(th) ;
yc = C(2)+R*sind(th) ;
subplot(2,3,3);
hold on;
plot(xc,yc,'g');
hold on;
[x,y,inside,outside,pii] = montecarlo(N3);
title({'N=10000'},pii);
plot(x(inside),y(inside),'b.');
hold on;
plot(x(outside),y(outside),'r.');
hold off;

xx1 = zeros(10,1);
xx2 = zeros(10,1);
xx3= zeros(10,1);
for number = 1:10
    [x,y,inside,outside,pii] = montecarlo(N);
     xx1(number)=pii;
    [x,y,inside,outside,pii] = montecarlo(N2);
     xx2(number)=pii;
    [x,y,inside,outside,pii] = montecarlo(N3);
     xx3(number)=pii;
end


subplot(2,3,4)
boxplot(xx1)
axis([0.5,1.5,2.5,3.5])
hold on;
yline(pi,'m--');
yticks([2.5 3 pi 3.5]);
yticklabels({2.5,3,'π',3.5})
hold on;
title({'N=1000, 10 losowań'})
hold on;

subplot(2,3,5)
boxplot(xx2)
axis([0.5,1.5,2.5,3.5])
hold on;
yline(pi,'m--');
yticks([2.5 3 pi 3.5]);
yticklabels({2.5,3,'π',3.5})
hold on;
title({'N=100, 10 losowań'})
hold on;

subplot(2,3,6)
boxplot(xx3);
axis([0.5,1.5,2.5,3.5])
hold on;
yline(pi,'m--');
yticks([2.5 3 pi 3.5]);
yticklabels({2.5,3,'π',3.5})
hold on;
title({'N=10000, 10 losowań'})
hold off;

%% Monte Carlo kod
function [x,y,inside,outside,pii] = montecarlo(N)
x = rand(N,1);
y = rand(N,1);
r = x.^2 + y.^2;
inside = r<=1;
outside = r>1;
pii=4*sum(inside)/N;

end

%% Wnioski
% Wraz ze zwiększaniem liczby próbek, przybliżamy się do poprawnej wartości
% liczby π. Algorytm bada czy nasze punkty znajdują się w okręgu i jeśli
% tak, to sprawdza ile ich jest, następnie mnoży to razy 4 i dzieli przez
% liczbę naszych próbek.
