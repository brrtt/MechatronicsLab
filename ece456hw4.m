%J Barrett Chesebrough
%ece 456-602
%hw 4

%% Problem 1
clc;
% A free running binary counter is connected to the input of a DAC. Then,
% the analog output of the DAC and the analog input signal are ran through
% a comparator. The comparator's output controls when the counter is
% running. As the counter increments, the DAC outputs a higher voltage. If
% the analog signal input is greater than the DAC output, then the
% comparator output will stay high and the counter will continue to
% increment. When the DAC output becomes greater than the analog input, the
% comparator will transition from high to low, and cause the shfit register
% to load the count the DAC output and update the ADC circuit output. Then
% the counter will recieve a low signal that activates an active-low load
% input causing it to reset on the next clock pulse. 

%part b
%see simulink

%% Problem 2
clc;
% part b

adc(4,5,3)
adc(5,8,5.3)

%% Problem 3
clc;
% part a

adcWords=[8 10 12 16 32 64];
clock=1e6;

conversionTime=(1/clock).*adcWords

% part b
plot(adcWords,conversionTime,'-r')
title('conversion time vs word size ADC');
ylabel('conversion time (s)');
xlabel('word size (#bits)'); 

% part c

%conversion time and word size are directly proportional. 

% part d

samples=5e3*10;
byte=8;
adcByteWords=(1/byte).*adcWords;
memoryByADC=(adcByteWords.*samples)

%% Problem 4
clc;
%part a
syms s0 s1 s2 s3 s4 R

vRef=10;
vOut= -1*(R/R*vRef*s0+R/(R/2)*vRef*s1+R/(R/4)*vRef*s2+R/(R/8)*vRef*s3+R/(R/16)*vRef*s4)

%part b
%see simulink

%part c

vO=[-2.97 -2.97 -1.98 -1.98 -.99];
stem(vO,'-r')
title('Weighted Resistor Network Output Response');

%% Problem 5

syms s0 s1 s2 s3 s4 R
vRef=10; 
vOut=-1*(s0*vRef/(2*R)+s1*vRef/(4*R)+s2*vRef/(8*R)+s3*vRef/(16*R)+s4*vRef/(32*R))

%part b
%see simulink 

%part c

vO=[-2.97 -2.97 -1.96 -1.96 -.99];
stem(vO,'-r');
title('R 2R Ladder Output Response'); 

%part d
%The Weighted Resistor Network is easier build because it requires one
%fewer resistor and ground. 



