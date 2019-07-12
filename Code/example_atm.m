clc
clear
close all
%% Example 4 - photochemical smog model; Gelinas (1972)

%% atmospheric.m calls the odes to be solved.

opts_1 = odeset('Stats','on');%,'Jacobian',@(t,y) stiff2_J(y,t));
format long

y0=zeros(1,12);
y0(1)=4;y0(5)=11.2;
tspan=[0,10];

tic
[t,y,fevals] = ode_Mic(@atmospheric,tspan,y0);
toc
fprintf('Fevals = %i \n',fevals)
fprintf('Steps = %i \n',length(t))
for i=1:length(y0)
   figure
   plot(t,y(:,i))
   xlim(tspan)
end

tic
[t,y] = ode15s(@(t,y) atmospheric(y,t),tspan,y0,opts_1);
toc
fprintf('Steps = %i \n',length(t))

for i=1:length(y0)
   figure
   plot(t,y(:,i))
   xlim(tspan)
end

tic
[t,y] = ode23s(@(t,y) atmospheric(y,t),tspan,y0,opts_1);
toc
fprintf('Steps = %i \n',length(t))

for i=1:length(y0)
   figure
   plot(t,y(:,i))
   xlim(tspan)
end

tic
[t,y] = ode45(@(t,y) atmospheric(y,t),tspan,y0,opts_1);
toc
fprintf('Steps = %i \n',length(t))

for i=1:length(y0)
   figure
   plot(t,y(:,i))
   xlim(tspan)
end