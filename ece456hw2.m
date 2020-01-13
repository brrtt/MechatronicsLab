%J Barrett Chesebrough
%ece 456-602
%hw 2
%% Problem 1

k0=1;
d0=10;
k2=.75;
L=1.5;
k1(1,50)=0; 
fLED(1,50)=0; 
F(1,50)=0;
h=1:1:50;

fMAX=k2*(L./(4*pi*(2*d0).^2));

for x=1:1:50
    if x<d0
    k1(x)=k0*(x/d0)^3;
    fLED(x)=fMAX;
    elseif x>=d0
    k1(x)=k0;
    fLED(x)=k2*(L./(4*pi*(2*x).^2));
    end
end

F=k1.*fLED;
rangeF=range(F)                             %(a) range F= 2.381e-7 <F< 2.381e-4
minF=min(F);
maxF=max(F);                                   
plot(h,F)                                   %(b) F vs h
grid on;
ylabel('flux (W/m^2)', 'fontsize', 12.5);
xlabel('h (mm)', 'fontsize', 12.5);

RLI=(F./fMAX)*100; 

plot(h,RLI);                               %(c) normalized flux vs RLI
ylabel('reflected light intensity', 'fontsize', 12.5);
xlabel('h (mm)', 'fontsize', 12.5);

i=5;                                        %(d) sensitivity
fSense5 = (F(i+1)-F(i))./(h(i+1)-h(i));     %fSensitivity(h=5)= 2.0367e-5
i=15;
fSense15 = (F(i+1)-F(i))./(h(i+1)-h(i));    %fSensitivty(h=15)=-1.2045e-5
i=25;
fSense25 = (F(i+1)-F(i))./(h(i+1)-h(i));    %fSensitivty(h=25)=-2.7016e-6

%% Problem 2

syms iS vT v 
n=3;

i=iS*(exp(v/(n*vT))-1);
% ln(i/iS) = ln(exp(v/(n*vT))-1)
% ln(i/iS) = v/(n*vT)
%        v = (n*vT)*ln(i/iS)                (a)

% (i2-i1)/E                                 (b)

iPRIME=diff(i,vT);

iS=25e-9; 
vT=23.5e-3;
v=.5;

iSENSE=-(iS*v*exp(v/(3*vT)))/(3*vT^2);      %(c) iSense= -0.0091

%% 2d part 1
V=-0.45:0.1:0.45; %set the voltage range
IS=25e-9; %set the reverse current
N = 3; % set the emission coefficient
Vt = [21:0.1:25]; % set the thermal voltage range, mV

[X1,Y1]=meshgrid(V,Vt); 
I=IS*(exp(X1./(N*10^(-3)*Y1))-1); %calculate current
figure(1); %create a new figure;
mesh(X1,Y1,I); %draw the 3D graph
xlabel('Voltage (v)'); %label the x-axis
ylabel('Thermal voltage (mV)');%label the y-axis
zlabel('Current (A)'); %label the z-axis

%% 2d part 2
I=.1:.01:20; %set the current range
IS=25e-9; %set the reverse current
N = 3; % set the emission coefficient
Vt = [21:0.1:25]; % set the thermal voltage range, mV

[X1,Y1]=meshgrid(I,Vt); 
V = (N.*Y1).*log(X1/IS); 
mesh(X1,Y1,V); %draw the 3D graph
zlabel('Voltage (v)'); %label the x-axis
ylabel('Thermal voltage (mV)');%label the y-axis
xlabel('Current (A)'); %label the z-axis

%% Problem 3
%(a)
% UltraSonic sensors have a deadband from 0 to 3cm because 
% the transmitted signal does not have enough distance to propagate
% in a meaningful way. The transfer function is equal to zero until 3cm. 

%% Problem 4

lField=100*3*12;
nPfield=18000;
nPrev=360;

pulseFoot=lField/nPfield; 
r=(pulseFoot*nPrev)/(2*pi)      %r=11.46 inches

%% Problem 6
%(a)
%#  bin     gray
%0  0000    0000
%1  0001    0001   
%2  0010    0011
%3  0011    0010
%4  0100    0110
%5  0101    0111
%6  0110    0101
%7  0111    0100
%8  1000    1100
%9  1001    1101
%10 1010    1111

%(b)
%all 4 bits change in binary going from 7 to 8 but only 1 changes for gray
%code. 
%7 = 0100 | 8 = 1100
%possible forms of 8:
%0110
%0101
%1100
%0000

%(c)
%Gray code resolves this problem by always only changing one bit between
%numbers. For logic, it means only having to utilize one gate to change a
%bit rather than a variable number of gates for binary, solving the
%multiple bit transition problem. 




