%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 2)- Vrep
function [vel]= diffconstraints(ul,ur,theta)

r=0.035; L= 0.23;

% ul= (ul*2*pi)/60;ur= (ur*2*pi)/60;
thetadot= (r/L)*(ur-ul);
% theta= (r/L)*(ur-ul);

x= (r/2)*(ul+ur)*cos(theta);

y= (r/2)*(ul+ur)*sin(theta);

% x=(floor(x/resolution))*resolution; 
% y=(floor(y/resolution))*resolution; 

vel= [x y thetadot];
end