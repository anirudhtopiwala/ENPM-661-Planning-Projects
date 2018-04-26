%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 2)- Vrep
function [ ]= maketext(vel,t)
% This function is used to split the time taken from vrep simulation to
% duplicate velocities with a calculated minimum time period. This is done
% because time in vrep runs differently from time in matlab.

% load('vel.mat')
% load('t.mat')

%% Forming time variable, to get how long setting orientation or setting position is taking
vel(1,:)=[];
t=t-t(1); 
for i=2:size(t,2)
     t1(i-1)= t(i)-t(i-1);
end
tmin=min(t1);

%% Defining and Opening File
dir= strcat('../Output/Output with time period of = ',num2str(tmin));
fileID = fopen(dir,'w');
formatSpec = 'linear.x = %f, linear.y = %f, linear.z = 0.0, angular.x = 0.0, angular.y = 0.0, angular.z = %f \n';
%% Initializing Variables
k=1;i=1; vx=[];vy=[];theta=[];
% t1(end)=[];
t1=round(t1/tmin);


for i=1:size(t1,2)
    for j=1:t1(i)
        vx=vel(i,1); vy=vel(i,2);theta=vel(i,3);
        fprintf(fileID,formatSpec,vx,vy,theta);
    end
end


%% Closing File
fclose(fileID);
end