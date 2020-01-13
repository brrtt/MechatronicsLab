% bc
% assorted bits 

%% block diagram simplify
syms s
clc;

g=2/(2*s^2+3*s);
h=2
tf=g/(1+g*h)

simplify(tf)


%% system eq 1
syms o
clc;
c=.6;
co=.7;
g1=11.2E6;
g2=5.6E6;
l=72;

j1 = pi/2*c^4;
j2 = pi/2*(co^4-c^4);

f1 = 5E3 == (g1*j1*o)/l+(g2*j2*o)/l;

a=solve(f1,o);
b=double(a)

tb=co/l*b*g2
ts=c/l*b*g1

%% system eq 2

syms ta td
clc;

f1 = 500 == ta + td;
f2 = 0 == .0977E-3*ta-pi/180*1.5+.070669E-3*td;

sol=solve([f1,f2],[ta,td]);
taSol = sol.ta;
tdSol = sol.td;
double(taSol)
double(tdSol)

%% Laplace transform
syms s
clc;

Y=5/(s+5);
ilaplace(Y)

%% residue 
clc;

[R,P,K]=residue([10], [1 11 10 0])


%% diff
syms x x1
clc;
y=x1/(1*(.01+x)^2);
diff(y,x)

%% residue + tf + bode + step response 

syms s t;
clc;

[r,p,k]=residue([1],[.01 10.1 110 .001])
sys=tf([1],[.01 10.1 110 .001])
bode(sys);
grid


%% residue 
[r,p,k]=residue([1],[.01 10.1 110 .001 0])

%% ece456 lab something

clc;
wavel=[650, 590, 570, 510, 475, 420];
testavg=[27, 23, 33, 14.3, 8, 12.3];

plot(wavel,testavg)
ylabel('sensor reading (avg)'); 
xlabel('wavelength (nm'); 
title('light sensor value for different colors'); 

%% rpk residue
clc;
[r,p,k]=residue(1,[1 2 3])

%% stepinfo
clc;

sys=tf(100,[1 10 100]);

sys1=step(sys);
plot(sys1);

sysinfo=stepinfo(sys)
damp(sys)
wn=sqrt(100)
zi=5.00e-01;
st=log(.05)/(wn*zi)

%% rpk 

clc;
sys=tf(7,[3 -1 2])

sys1=step(sys);
plot(sys1);

[r,p,k]=residue(7,[3 -1 2])

%% moment of inertia

%iFlange=(1/12*bf^4+bf*tf*(d/2-tf/2)^2;


%% step response

sys=tf(1,[1 4 6 4 5])
step(sys)

%% ece456 lab45

f=[62.7 102.4 149.34 83.37 101.5 130.9 48.72 61.5 64.5];
wE=15.*60/180.*f
w=60/180.*f
vAvg=[2.5 3.5 4.5 3 3.5 4 2.5 2.5 2.5]
scatter(vAvg,w)
xlabel('PWM voltage (v)');
ylabel('rotational speed (w)'); 
title('PWM voltage vs Rotational Speed for Motor'); 

%% rltool edit architecture

fs=tf(1,[1 0 0])
Ss=tf(1,[.1 1])
hs=tf([.5 1],[.25 1])
rltool(fs)

%% ece456 lab 6

Rp=10.227e3
R1=1e3
R2=1e3
C1=.1e-6

Ra50=R2+Rp
Rb=R2+.8*Rp


%t1=.67*Ra*C1
%t2=.67*Rb*C1
%T=t1+t2
%f=1/T

%% linearization
 x = [0.0:0.0001:0.01]; % set up a vector of x values
 Fnls = 2.5.*x.^0.5; % compute NLS force
 Flins = 31.25*x+0.05; % compute linearized spring force
 plot (x, Fnls, x, Flins) % plot both force against deflection
 xlabel('Deflection (m)') % add x and y labels and grid to plot
 ylabel('Force (N)')
 grid

