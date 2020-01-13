%J Barrett Chesebrough
%ECE 456-602
%HW 1
%% Problem 1
clc; 

uft=[1 2 3 4 5 6 7 8];
u=30.48.*uft;

y=[30.3 61.4 91.7 121.8 152.7 184.3 214.7 244.2; 
   30.3 61.4 91.7 121.9 152.7 183.9 214.2 245.5];

plot(u,y); 
xlabel('actual distance'); 
ylabel('measured distance'); 

y1=y(1,:);
y2=y(2,:); 

y1Diff=abs(y1-u); 
y1MaxErr=max(y1Diff);       %(b)maximal error:1.42 @6ft 

y1Err=y1Diff./u;
y1RelMaxErr=max(y1Err);     %(e)maximal relative error:0.0078 @6ft

y2Diff=abs(y2-u); 
y2MaxErr=max(y2Diff);       %(c)maximal error:1.66 @8ft

y2Err=y2Diff./u;
y2RelMaxErr=max(y2Err);     %(f) maximal relative error:0.0072 @2ft

yDiff=[y1Diff; y2Diff];
plot(u,yDiff);              %(d) error plot 
xlabel('actual distance');
ylabel('error'); 

%% Problem 2
clc; 
format short;

v=[10 20 30 40 50 60 70 80 90 100];
w=[1.05 2.56 4.07 5.58 7.19 8.66 10.27 11.77 13.26 15.03;
   1.13 2.68 4.21 5.76 7.42 8.97 10.57 12.06 13.51 15.42];
for i = 1:10
    wAvg(1,i)=(w(1,i)+w(2,i))/2; 
end

plot(v,wAvg);
xlabel('% voltage');
ylabel('avg speed'); 


