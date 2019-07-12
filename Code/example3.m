clc
clear
close all

%% Example 3 - Orgenator reaction
y0 = [1,2,3];
tspan = [0,500];

%% stiff3.m calls the odes to be solved. stiff3_J.m is the analytical jacobian function.

disp('ode_Mic - Analytical Jacobian')
tic
[t,y, fevals] = ode_Mic(@stiff3,tspan,y0,@stiff3_J);
toc
figure
semilogy(t,y(:,1),t,y(:,2),t,y(:,3)); 
xlabel('$x$','Interpreter','latex')
ylabel('$y_2$','Interpreter','latex')
xlim(tspan)
xlabel('time')
ylabel('Concentration')
fprintf('Fevals = %i \n',fevals)
fprintf('Steps = %i \n',length(t))
disp('ode_Mic - Numerical Jacobian')
tic
[t,y, fevals] = ode_Mic(@stiff3,tspan,y0);
toc
figure
semilogy(t,y(:,1),t,y(:,2),t,y(:,3)); 
xlim(tspan)
xlabel('time')
ylabel('Concentration')
fprintf('Fevals = %i \n',fevals)
fprintf('Steps = %i \n',length(t))

opts_1 = odeset('Stats','on','Jacobian',@(t,y) stiff3_J(y,t));
opts_2 = odeset('Stats','on');%,'Jacobian',@(t,y) stiff3_J(y,t));


disp('ode15s - Analytical Jacobian')
tic
[t,y] = ode15s(@(t,y) stiff3(y,t),tspan,y0,opts_1);
toc
figure
semilogy(t,y(:,1),t,y(:,2),t,y(:,3)); 
xlim(tspan)
xlabel('time')
ylabel('Concentration')
xlabel('$x$','Interpreter','latex')
ylabel('$y_2$','Interpreter','latex')

fprintf('Steps = %i \n',length(t))
disp('ode15s - Numerical Jacobian')
tic
[t,y] = ode15s(@(t,y) stiff3(y,t),tspan,y0,opts_2);
toc
figure
semilogy(t,y(:,1),t,y(:,2),t,y(:,3)); 
xlim(tspan)
xlabel('time')
ylabel('Concentration')
fprintf('Steps = %i \n',length(t))

disp('ode23s - Analytical Jacobian')
tic
[t,y] = ode23s(@(t,y) stiff3(y,t),tspan,y0,opts_1);
toc
fprintf('Steps = %i \n',length(t))
figure
semilogy(t,y(:,1),t,y(:,2),t,y(:,3)); 
xlim(tspan)
xlabel('time')
ylabel('Concentration')
disp('ode23s - Numerical Jacobian')
tic
[t,y] = ode23s(@(t,y) stiff3(y,t),tspan,y0,opts_2);
toc
fprintf('Steps = %i \n',length(t))
figure
semilogy(t,y(:,1),t,y(:,2),t,y(:,3)); 
xlim(tspan)
xlabel('time')
ylabel('Concentration')

disp('ODE45 - Numerical Jacobian')
tic
[t,y] = ode45(@(t,y) stiff3(y,t),tspan,y0,opts_2);
toc
fprintf('Steps = %i \n',length(t))
figure
semilogy(t,y(:,1),t,y(:,2),t,y(:,3)); 
xlabel('$x$','Interpreter','latex')
ylabel('$y_2$','Interpreter','latex')
xlim(tspan)
xlabel('time')
ylabel('Concentration')