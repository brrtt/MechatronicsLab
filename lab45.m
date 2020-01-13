%Team 14
%Lab 4/5 Task 6

%% LPF 
f=10; %hz
RC=1/(f*2*pi) % RC=.0159 ==.016


%choose 1600 ohm resistance * 10uF capacitor
%choose 2x330,2x470 ohm resistors in series
1600*10E-6 % = RC=.016

%% ultrasonic interface
clc; 

myev3=legoev3('usb'); 
mymotor1=motor(myev3,'B');
mymotor2=motor(myev3,'C');

%% run/read
clc;
clear i;
clear usReadArray; 
run=1;
mymotor1.Speed=20;
mymotor2.Speed=23; 
while(run<500)
    tempRead=readInputDeviceREADY_RAW(myev3,3,0,1);
    if ( tempRead< 200)
        usRead=tempRead;
        run=run+1; 
    end
    usReadArray(run)=usRead
    if(usRead<33)
        stop(mymotor1)
        stop(mymotor2)
        break
    else
        start(mymotor1)
        start(mymotor2)
    end
     
end
stop(mymotor1)
stop(mymotor2)


i=1:1:run;
plot(i,usReadArray,'*')
xlabel('time')
ylabel('ultrasonic sensor reading') 
title('Ultrasonic Sensor Readings over Time')

