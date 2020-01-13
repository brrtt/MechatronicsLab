%J Barrett Chesebrough
%ece 456-602
%hw 6

%% Problem 1
clc;

ke=.3243;
kb=.4953;
R=4.67;
T=.001;

%% 1a / 1b 
 
%vb=kb*w;
%i=(V-vb)/r;
%T= ke*i;
W=[12 -10 4 16];
for i = 1:1:4
    w=W(i);
    V(i)=T*R/ke+kb*w;
    PW(i)=abs(V(i)/10*100);
    if V(i)<0
        sigState(i)=0; 
    else
        sigState(i)=1;
    end
end
V
PW
sigState

%% 1c 

%see simulink

%% Problem 2
clc; 

ke=.3234; 
kb=.4953;
R=4.67;
T=.001; 

%V=T*R/ke+kb*w;
w=(V-((T*R)/ke))/kb; 

%% problem 4

syms tau
d=6.2;
d0=7;
t=1;
d=d0*exp(-t/tau)

%% problem 5


FV=.3569                    %part a by inspection
tau=35.35                   %part b by inspection
val90=.9*FV;                
risetime=81.59-3.718        %part c
valSettle=FV-.02*FV; 
settlingtime=138            %part d


%t=0:50:500;
syms t
sys= FV*(1-exp(-t/tau));
%plot(t,sys)
%xlabel('time (s)'); 
%ylabel('w (rad/s)'); 



