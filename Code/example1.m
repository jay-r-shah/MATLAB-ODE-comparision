clc
clear
close all
%% Example 1 - rate equations; Seinfeld et al. (1970)
y0 = [1,0,0];
tspan = [0,10];

%% stiff1.m calls the odes to be solved. stiff1_J.m is the analytical jacobian function.

disp('ode_Mic - Analytical Jacobian')
tic
[t,y, fevals] = ode_Mic(@stiff1,tspan,y0,@stiff1_J);
toc
figure
semilogx(t,y(:,2))
xlabel('$t$','Interpreter','latex')
ylabel('$y_2$','Interpreter','latex')
xlim(tspan)
fprintf('Fevals = %i \n',fevals)
fprintf('Steps = %i \n',length(t))
disp('ode_Mic - Numerical Jacobian')
tic
[t,y, fevals] = ode_Mic(@stiff1,tspan,y0);
toc
figure
semilogx(t,y(:,2))
xlim(tspan)
fprintf('Fevals = %i \n',fevals)
fprintf('Steps = %i \n',length(t))

opts_1 = odeset('Stats','on','Jacobian',@(t,y) stiff1_J(y,t));
opts_2 = odeset('Stats','on');%,'Jacobian',@(t,y) stiff1_J(y,t));


disp('ode15s - Analytical Jacobian')
tic
[t,y] = ode15s(@(t,y) stiff1(y,t),tspan,y0,opts_1);
toc
figure
semilogx(t,y(:,2))
xlim(tspan)
xlabel('$t$','Interpreter','latex')
ylabel('$y_2$','Interpreter','latex')

fprintf('Steps = %i \n',length(t))
disp('ode15s - Numerical Jacobian')
tic
[t,y] = ode15s(@(t,y) stiff1(y,t),tspan,y0,opts_2);
toc
figure
semilogx(t,y(:,2))
xlim(tspan)
fprintf('Steps = %i \n',length(t))

disp('ode23s - Analytical Jacobian')
tic
[t,y] = ode23s(@(t,y) stiff1(y,t),tspan,y0,opts_1);
toc
fprintf('Steps = %i \n',length(t))
figure
semilogx(t,y(:,2))
xlim(tspan)
disp('ode23s - Numerical Jacobian')
tic
[t,y] = ode23s(@(t,y) stiff1(y,t),tspan,y0,opts_2);
toc
fprintf('Steps = %i \n',length(t))
figure
semilogx(t,y(:,2))
xlim(tspan)

disp('ODE45 - Numerical Jacobian')
tic
[t,y] = ode45(@(t,y) stiff1(y,t),tspan,y0,opts_2);
toc
fprintf('Steps = %i \n',length(t))
figure
semilogx(t,y(:,2))
xlabel('$t$','Interpreter','latex')
ylabel('$y_2$','Interpreter','latex')
xlim(tspan)