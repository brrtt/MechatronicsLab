% J Barrett Chesebrough
% ece 456-602
% hw 8

%% Problem 1
clc;
u0=75;
Ki=1;
Kd=15;
Kp=50;

% a) 
syms x
t=[1 2 9];
e=[0 -2 -1];
ei=-2*x+2;
ed=.5*x-5.5; 

u1=Kp*e(1)+Ki*int(ei,x,0,t(1))+Kd*diff(ei,x)+u0
u2=Kp*e(2)+Ki*int(ei,x,0,t(2))+Kd*diff(ei,x)+u0
u3=Kp*e(3)+Ki*(int(ed,3,t(3))+int(ei,x,0,3))+Kd*diff(ed,x)+u0

% b) see simulink 

% c) The massive derivative gain causes the control signal to overcorrect
% for the two different slopes. 

%% Problem 2

% a) 
tau=1;
sys=tf(1,[tau 1]);
Kp=1.2
Ki=3

% b) see simulink

%% Problem 3
clc;

sys=tf(1,[1 6 11 6]); 

% a) see simulink 

% b)
step(sys,6)

% c) see simulink and below

t1=1.12;
yMax=1.429e-1;
ypMax=7.21e-2;

y0=-1*ypMax*t1; 
%y=mx+b
%x=(y-b)/m
t2=(yMax-y0)/ypMax;

L=t1-0
P=1
T=t2-t1; 
R=yMax/T

% d)
Kp=.9*P/(R*L)
Ti=3.33*L

% e) 
Kp=1.2*P/(R*L)
Ti=2*L
Td=.5*L

% f) see simulink

% g) see simulink 

% h) PI Controller: riseTime=828.07 ms Overshoot=17.059% 
%   PID Controller: riseTime=846.82 ms Overshoot=14.368%
% The PI controller rises faster and overshoots more than the PID leading
% to the conclusion that the faster the risetime, the larger the overshoot.
% Derivative control likely had a part to play in reducing the overshoot in
% this interval. 

%% Problem 4

% a) Reduce Ki
% b) Increase Kd
% c) Increase or Decrease Kp depending on which side of line. 

%% Problem 5

% a)
deltaZi=0:2:10;
deltat=[.0001,.001,.01,.1,1,1];
Kd=2;

[X,Y]=meshgrid(deltat,deltaZi);
deltaUk=(Kd.*Y)./X

% b) 
mesh(X,Y,deltaU);
xlabel('delta t');
ylabel('delta Zi ');
zlabel('delta Uk');

% c) delta Uk varies directly with delta Zi with a linear slope. 

% d) delta Uk is inversely proportional to delta t with a 
%    dramatic expontential decay, nearing zero before t=.05. 
%    nearing 







