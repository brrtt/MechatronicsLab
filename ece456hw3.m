%J Barrett Chesebrough
%ece 456-602
%hw 3

%% Problem 1 
clc;
i=1;
j=1;
k=1;
rgbsense=zeros(2500,1); 
rgbtime=zeros(2500,1);
rgbformat=zeros(2500,2);
fileID=fopen('HW3.1 colorsensor_red.txt','r'); 
formatSpec= '%f';
[rgb,count]=fscanf(fileID,formatSpec);
for i=1:5000
   if rgb(i) < 1.00
       rgbtime(j)=double(rgb(i));
       j=j+1;
   elseif rgb(i) > 1.00 
       rgbsense(k)=double(rgb(i));
       k=k+1;
   end
end

rgbformat(:,1)=rgbtime;
rgbformat(:,2)=rgbsense;

%% part a 
clc;

fc=2*pi*10;
rc=1/fc;                %RC=.016 use R=160 ohms C=100uF
sys=tf([1],[.016 1]);
ts=[.1 .2 .5];
dtf1=c2d(sys,ts(1))
dtf2=c2d(sys,ts(2))
dtf3=c2d(sys,ts(3))

%% Problem 2
clc;

vb=0:.001:.1;
t=0:1:100;
vInput(:,1)=t;
vInput(:,2)=vb;

%% Problem 3
clc;

v1=2.12;
v2=2.18;
r1=27;
r2=81;
r3=243;
r1a=r1;
r2a=r2;
r3a=r3;
r1b=r1a;
r2b=r2a;
r3b=r3a;

vOut=20*(v2-v1);                        %vOut=1.2V
rg=(2*r1)/(vOut*(r2/r3)/(v2-v1)-1);     %rg=9.5294 ohms


