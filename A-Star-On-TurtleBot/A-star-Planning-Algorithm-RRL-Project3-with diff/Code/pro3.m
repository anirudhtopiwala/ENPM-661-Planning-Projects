%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 3)
% Implementation of A Star Algorithm on Obstacle Space of Project 3 with
% Differential Constraints

%Clearing Variables
clc;clear all;close all;

 % This is to restart with a new set of (xstart,ystart) and (xgoal,ygoal)
 button='Yes'; 
%  while(strcmp(button,'Yes'))

 
 %% Draw GUI = World space with Obstacles
drawobstaclespace();

%% Taking Input from User
% Setting Resolution, depending upon the angular velocities given.
[resolution,actions]= getresolution(50,100);
% Taking G-input
check=1;
while(check==1) %While loop to check if values of (xstart,ystart,xgoal,ygoal) are valid or not.
title('Click a point in the world space to set starting point for the path plan!!');
[xstart,ystart]=ginput(1);

% xstart=2; ystart=2;
xstart=(floor(xstart/resolution))*resolution; 
ystart=(floor(ystart/resolution))*resolution; 
rectangle('Position',[xstart ystart resolution resolution ], 'FaceColor','red','EdgeColor','k');


title('Click a point in the world space to set end point for the path plan!!');
[xgoal,ygoal] = ginput(1);
% xgoal=5;ygoal=5;
xgoal=(floor(xgoal/resolution))*resolution; 
ygoal=(floor(ygoal/resolution))*resolution; 

    if(~(checkforexist(xstart,ystart,resolution)))
        uiwait(msgbox('Inavalid Start Point Input. Click a point inside the valid workspace'));
    elseif(~(checkforexist(xgoal,ygoal,resolution)))
         uiwait(msgbox('Inavalid End Point Input. Click a point inside the valid workspace'));
    else
         check=0;
    end
end
% xstart=2; ystart=2; xgoal=3;ygoal=3;

rectangle('Position',[xgoal ygoal resolution resolution ], 'FaceColor','blue','EdgeColor','k');
tic
%% Initialize Varaibles
theta=0;% Initial orientation is set as 0
open= [xstart,ystart,theta]; % X,Y,theta  positions of nodes in Open List
X=[xstart,ystart,theta]; % X,Y, theta positions of all possible nodes Explored.
vel=[0 0 0]; % Keeping track of the 3 changing velocities [vx vy thetadot]
cost(1)= 0; % Overall Cost of all nodes in Open List
c=0; % C2c of all possible nodes.
c2c(1)=0; % C2c of all nodes in open list.
Pnode(:,:,1)=[1 1]; % Intializing the parentnode storage. 
ncount=2; % Initializing Node count for all nodes (to keep track of nodes in X).
pcount=2; % Initializing Node count for open list (to keep track of nodes in open)
count=1;% Initialing parent node count.
closelist= [0 0 0];% Initializing Close list (it will store X and Y pos of nodes in closelist.
t=10; % Time period (reason for increased value is to get faster results.

%% Main Loop

while(~isempty(open))

[m,index]=min(cost);
x= open(index,1); y= open(index,2);theta=open(index,3);
[~,count]=ismember([x y theta],X,'rows');
[~,c2ccount]=ismember([x y theta],open,'rows');
if (abs(x-xgoal)< (0.1) && abs(y-ygoal)< (0.1))
    xgoal=x;ygoal=y;thetagoal=theta;
    break
end
%% (Ul,Ur)= (100,100);
ul=actions(1,1);ur=actions(1,2); c2cdiff=0.1833; % Here value of c2cdiff is manually calulated for the actions specified.
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);


%% (Ul,Ur)= (50,50);
ul=actions(2,1);ur=actions(2,2);c2cdiff=0.0916;
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);



%% (Ul,Ur)= (100,50);
ul=actions(3,1);ur=actions(3,2);c2cdiff=0.1374;
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);


%% (Ul,Ur)= (50,0);
ul=actions(4,1);ur=actions(4,2);c2cdiff=0.0458;
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);


%% (Ul,Ur)= (100,0);
ul=actions(5,1);ur=actions(5,2);c2cdiff=0.0916;
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);


%% (Ul,Ur)= (0,100);
ul=actions(6,1);ur=actions(6,2);c2cdiff=0.0916;
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);

%% (Ul,Ur)= (0,50);
ul=actions(7,1);ur=actions(7,2);c2cdiff=0.0458;
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);


%% (Ul,Ur)= (50,100);
ul=actions(8,1);ur=actions(8,2);c2cdiff=0.1374;
[xy,v]=diffconstraints(ul,ur,x,y,theta,resolution,t);
[X,Pnode,ncount,pcount,open,cost,c2c,c,vel]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,open,cost,c2cdiff,c2c,c,resolution,vel,v);




%% Popping out Current Node out of open list
cost(index)=[];
open(index,:)=[];
c2c(index)=[];
pcount=pcount-1;
%% Adding the popped out node in close list
closelist= [x y theta;closelist];

end



%% Back Tracking the parent node to find the path
fin=0;l=1;
[~, ncountfinal]= ismember([xgoal,ygoal thetagoal],X,'rows');
ncount=ncountfinal;
plt=[X(ncount,:), vel(ncount,:)];
% Storing the Path
path(l,:)=[plt(1) plt(2) plt(4) plt(5) plt(6) ];l=l+1;

count= Pnode(1,2,ncount);
plt=[X(count,:), vel(count,:)];
path(l,:)=[plt(1) plt(2) plt(4) plt(5) plt(6) ];l=l+1;

%Back Tracking
while(fin==0)
    count= Pnode(1,2,count);
    plt=[X(count,:), vel(count,:)];
    if(plt(1)==xstart && plt(2)==ystart)
        fin=1;
    end
    path(l,:)=[plt(1) plt(2) plt(4) plt(5) plt(6) ];l=l+1;
end
% Inverting the array, as we want path from first to last.
path= flipud(path);
xc=path(:,1); yc=path(:,2);
hold on
% Plotting Final path
for c=2:size(path,1) 
 plot(xc(c-1:c),yc(c-1:c),'r');
end

% Make Text File
maketext([path(:,3) path(:,4) path(:,5)],t);

toc
%     button = questdlg('Do you Want to try again');
% 
%     if (strcmp(button,'Cancel') || strcmp(button,'No'))
%         close all;
%         break;
%     else
%         close all;clc;clear all;
%         button='Yes';
%     end
%  end




