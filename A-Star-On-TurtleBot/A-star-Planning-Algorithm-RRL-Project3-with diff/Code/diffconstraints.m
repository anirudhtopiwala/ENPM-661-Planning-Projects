%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 3)
function [xy,vel]= diffconstraints(ul,ur,x,y,theta,resolution,t)

r=0.035; L= 0.23;
% t=18;
k=1;
ul= (ul*2*pi)/60;ur= (ur*2*pi)/60;
theta= (r/L)*(ur-ul)*t + theta;
thetadot=(r/L)*(ur-ul);

x= (r/2)*(ul+ur)*cos(theta)*t*k +x;
xdot= (r/2)*(ul+ur)*cos(theta);

y= (r/2)*(ul+ur)*sin(theta)*t*k +y;
ydot= (r/2)*(ul+ur)*sin(theta);

% x=(floor(x/resolution))*resolution; 
% y=(floor(y/resolution))*resolution; 

xy= [x y theta];
vel=[xdot ydot thetadot];
end