function [t,y,fevals] = ode_Mic(ode,tspan,y0,J,tol)
fevals = 0;
if ~exist('J')
    J = @(y,t) jacobianest(ode,y);
end
if ~exist('tol','var')
    tol = [10^-3,10^-7,10^-3];
end

a = 0.435867;
b2 = 3/4;
b31 = -0.630172;
b32 = -0.24235;
R1 = 1.03758;
R2 = 0.83494;
R3 = 1;

I = eye(length(y0));
y = zeros(length(tspan),length(y0));
t = zeros(length(tspan),1);
t(1) = tspan(1);
done = false;
i = 1;
y(i,:) = y0;
h_init = 1e-4;%(max(tspan)-min(tspan))/100;
h1 = h_init;
while ~done
    g = 2;
    [jacob1,jfevals] = J(y(i,:),t(i)); fevals = fevals + jfevals;
    inv_J1 = inv(I - h1*a*jacob1);
    
    while g>=1
        h = h1;
        k1 = h1*inv_J1*ode(y(i,:),t(i)); fevals = fevals + 1;
        k2 = h1*inv_J1*ode(y(i,:) + b2*k1',t(i)+h1); fevals = fevals + 1;
        k3 = inv_J1*(b31*k1 + b32*k2);
        ykp1_1 = y(i,:) + (R1*k1 + R2*k2 + R3*k3)';
        
        h2 = h1/2;
        inv_J2 = inv(I - h2*a*jacob1);
        k1 = h2*inv_J2*ode(y(i,:),t(i)); fevals = fevals + 1;
        k2 = h2*inv_J2*ode(y(i,:) + b2*k1',t(i)+h2); fevals = fevals + 1;
        k3 = inv_J2*(b31*k1 + b32*k2);
        ykp1_2_1 = y(i,:) + (R1*k1 + R2*k2 + R3*k3)';
        [jacob2, jfevals] = J(ykp1_2_1,t(i)+h2); fevals = fevals + jfevals;
        
        inv_J2 = inv(I - h2*a*jacob2);
        k1 = h2*inv_J2*ode(ykp1_2_1,t(i)+h2); fevals = fevals + 1;
        k2 = h2*inv_J2*ode(ykp1_2_1 + b2*k1',t(i)+2*h2); fevals = fevals + 1;
        k3 = inv_J2*(b31*k1 + b32*k2);
        ykp1_2_2 = ykp1_2_1 + (R1*k1 + R2*k2 + R3*k3)';
        h1 = h2;
        g = max(abs(ykp1_2_2 - ykp1_1)/tol);
    end
    E = (8/7)*(ykp1_2_2 - ykp1_1);
    y(i+1,:) = ykp1_2_2 + E/8;
    t(i+1) = t(i) + h;
    if t(i+1)>tspan(end)
        done = true;
    else
        i = i+1;
        h1 = h1*min((4*g)^(-0.25),3);
    end
end
end