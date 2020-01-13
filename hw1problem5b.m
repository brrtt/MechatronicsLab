%% Problem 5

syms vS
clc;


x=1/3;
vNL=x*vS;

rP=1000;
rL=10000; 
vL= (x*rP*rL)/(x*rP^2-x^2*rP^2+rP*rL)*vS;

vE=vNL-vL;
vpa(vE)

%vE=.724% of vS

for i=1:20
    rLr(i)=1000*i;
    vLr(i)= (x*rP.*rLr(i))/(x*rP^2-x^2.*rP^2+rP.*rLr(i));
end

plot(rLr,vLr);
xlabel('load resistance'); 
ylabel('load voltage');

