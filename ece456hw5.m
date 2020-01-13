%J Barrett Chesebrough
%ece 456-602
%hw 5

%% Problem 1
clc;

syms V w
ke=.3234;
kb=.4953;
r=4.67;

%% 1a
vb=kb*w;
i=(V-vb)/r;
T= ke*i;

Torque=vpa(T,3)

%% 1b 

w=0:.005:2;
vb=kb*w;
V=1;
i=(V-vb)/r;
T=ke*i;
V=3;
i=(V-vb)/r;
T1=ke*i;
V=5;
i=(V-vb)/r;
T2=ke*i;
V=7;
i=(V-vb)/r;
T3=ke*i;
V=9;
i=(V-vb)/r;
T4=ke*i;
plot(w,T,w,T1,w,T2,w,T3,w,T4)
xlabel('w (rad/s)'); 
ylabel('T (N.m)');
legend;
title('Torque/Speed relationship for DC Motor'); 
%x=1:2:9;
%y=x;
%[X,Y]=meshgrid(x);
%Z=ke*(Y-kb*X)/r
%mesh(Z)

%% 1c

v=(.01+.0343*10)/.0693 

%% Problem 2

A=4;
DC=[.25 .5 .75];
T=4;

avgV1=A*T*DC(1)
avgV2=A*T*DC(2) 
avgV3=A*T*DC(3)

%% Problem 3

% part A see attached simulink 

%The steady state values line up with eachother but the values found in
%problem 2 do not account for the time it takes to reach the steady state
%average signal. 

%% Problem 4
clc;

syms t s

R=1000;
C=5e-6;
Vin=12;

%% 4a
Tau=R*C;
VC=Vin/(s*Tau+1);
VCt=Vin*(1-exp(t/Tau))

%% 4b

Tau

VCs=tf(Vin,[Tau 1])
RT=[0.2 0.8];
ST=.02;
stepinfo(VCs,'RiseTimeLimits',RT,'SettlingTimeThreshold',ST)

%% Problem 5 

% 5a see attached simulink

%% 5b

RCV=12*.63
V20=12*.2
V80=12*.8

%% Problem 6

% 6a see attached simulink

% 6b 

chopper = [.5 .35 .9 .81 .2 .66] 
sigState= [1 0 1 1 1 0]
Vout    = [5 -3.4 8.8 8 2 -6.5]




