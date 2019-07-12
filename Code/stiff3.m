function dydt = stiff3(y,t)
if ~exist('t','var')
end
dydt = [77.27*(y(2) + y(1)*(1-8.375*1e-6*y(1) - y(2)));
    1/77.27*(y(3) - (1+y(1))*y(2));
    0.161*(y(1) - y(3))];
end