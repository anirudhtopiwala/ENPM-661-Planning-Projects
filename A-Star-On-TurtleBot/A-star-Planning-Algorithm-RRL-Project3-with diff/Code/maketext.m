%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 3)
function [ ]= maketext(vel,t)

t= 2*t; % Because time period needed is 0.5 seconds.
vx= vel(1,1);vy=vel(1,2);theta=vel(1,3);

%% Defining and Opening File
fileID = fopen('../Output/Output','w');
formatSpec = 'linear.x = %f, linear.y = %f, linear.z = 0.0, angular.x = 0.0, angular.y = 0.0, angular.z = %f \n';
fprintf(fileID,formatSpec,vx,vy,theta);

for i=2:size(vel,1)
    for j=1:t
    vx= vel(i,1);vy=vel(i,2);theta=vel(i,3);
    fprintf(fileID,formatSpec,vx,vy,theta);
    end
end

fclose(fileID);
end