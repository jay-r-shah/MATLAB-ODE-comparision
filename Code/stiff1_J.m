function [dydt,jfevals] = stiff1_J(y,t)
if ~exist('t','var')
end
jfevals = 0;
dydt = [-0.04,1e4*y(3),1e4*y(2);
    0.04,-1e4*y(3)-2*3e7*y(2),-1e4*y(2);
    0,2*3e7*y(2),0];
end