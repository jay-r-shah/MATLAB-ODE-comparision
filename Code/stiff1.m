function dydt = stiff1(y,t)
if ~exist('t','var')
end

dydt = [-0.04*y(1) + 1e4*y(2)*y(3);
    0.04*y(1)-1e4*y(2)*y(3) - 3e7*y(2)^2;
    3e7*y(2)^2];
end