% J Barrett Chesebrough
% ece 456-602
% hw 7 

%% Problem 1
clear;
% a) see attached page

% b) deltaYhat varies directly with deltG and U(s)

% c)

deltG=[0 .2 .4 .6 .8];
for u=1:2:9
    U(u,:)=u.*deltG;
end

plot(deltG,U(1,:),deltG,U(3,:),deltG,U(5,:))
legend;
ylabel('deltYhat');
xlabel('deltG'); 
title('delta Y hat with different Us');


%% Problem 2
clear;

% a) see attached page

% b) With a constant G(s), deltaYhat(s)/R(s) asymptotically approaches 0 as
% deltaG increases. The y intercept of deltaYhat(s)/R(s) increases as K
% increases. 
% 

deltG=[0 .2 .4 .6 .8]
%u=[1 3 5 7 9];
G=.5;

for k= 1:1:5
    deltYhat(k,:)= k*G/(1+k*G)-k.*deltG./(1+k.*deltG);
end

deltG=0:.2:.8
plot(deltG,deltYhat(1,:),deltG,deltYhat(2,:),deltG,deltYhat(3,:))
legend;
ylabel('deltYhat(s)/R(s)');
xlabel('deltG'); 
title('deltaYhat/R with different Ks');







%% Problem 3
clc;

% a) see attached simulink 

tau=1;
Gs=tf(1,[tau 1 0])

% b) see attached simulink
Kp=1.65

% c) see attached simulink

% d) see attached simulink 

% e) Overshoot and rise time directly vary with K. Settling
% time is unaffected by changes in the value K. 

%% Problem 4
clc; 

% a)
u0=50;
Ki=.1;
i=1;
syms x
for t=0:1:5
    if (t<=2)
        e(i)=4*t;
        ei=4*x;
        u(i)=Ki*int(ei,x,0,t)+u0;
    else
        e(i)=8;
        u(i)=Ki*(8*(t-2)+int(ei,x,0,2))+u0;
    end
    i=i+1;
end
U=double(u)

% b)
t=0:1:5;
plot(t,u,t,e);
legend('u(t)','e(t)');
xlabel('time (s)');
ylabel('control & error (%)')
title('Control & Error of Integral Controller')

%% Problem 5 
clc;
clear;
u0=50; 
Kd=.5; 
i=1;

% a)
syms x 
for t=0:1:10
    if t<3
        e(i)=2*t;
        ed=2*x;
        u(i)=Kd*diff(ed,x)+u0;
    elseif t<5
        e(i)=6;
        u(i)=u0;
    else
        e(i)=-1*t+11;
        ed=-x+11;
        u(i)=Kd*diff(ed,x)+u0;
    end
    i=i+1;
end
U=double(u)

% b)
t=0:1:10;
plot(t,u,t,e)
legend('u(t)','e(t)');
xlabel('time (s)');
ylabel('control & error (%)')
title('Control & Error of Derivative Controller')

% c) Derivative Co


