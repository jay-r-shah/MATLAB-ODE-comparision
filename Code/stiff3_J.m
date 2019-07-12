function [dydt,jfevals] = stiff3_J(y,t)
if ~exist('t','var')
end
jfevals = 0;
s = 77.27;w = 0.161; q = 8.375e-6;
dydt = [s*(-y(2)+1-q*2*y(1)),s*(1-y(1)),0;
    -y(2)/s,(-1-y(1))/s,1/s;
    w,0,-w];
end