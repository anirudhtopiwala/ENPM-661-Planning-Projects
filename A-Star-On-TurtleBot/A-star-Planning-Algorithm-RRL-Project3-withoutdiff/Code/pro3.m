%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 2)
% Implementation of A Star Algorithm on Obstacle Space of Project 3 without
% Differential Constarints

%Clearing Variables
clc;clear all;close all;

 % This is to restart with a new set of (xstart,ystart) and (xgoal,ygoal)
 button='Yes'; 
 while(strcmp(button,'Yes'))


 
 %% Draw GUI = World space with Obstacles
drawobstaclespace();

%% Taking Input from User
resolution=0.1;%Resolution can be changed depending on User. Please note that with increase in resolution, path found may slightly go into the obstacles. I recommend to keep resolution as 1

% Taking G-input
check=1;
while(check==1) %While loop to check if values of (xstart,ystart,xgoal,ygoal) are valid or not.
title('Click a point in the world space to set starting point for the path plan!!');
[xstart,ystart]=ginput(1);
% % xstart=2; ystart=2;
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
% xstart=2; ystart=2; xgoal=5;ygoal=5;
rectangle('Position',[xgoal ygoal resolution resolution ], 'FaceColor','blue','EdgeColor','k');
tic
%% Initialize Varaibles
open= [xstart,ystart]; % X,Y positions of nodes in Open List
X=[xstart,ystart];  % X,Y positions of all possible nodes Explored.
cost(1)= 0; % Overall Cost of all nodes in Open List
c=0; % C2c of all possible nodes.
c2c(1)=0; % C2c of all nodes in open list.
Pnode(:,:,1)=[1 1]; % Intializing the parentnode storage. 
ncount=2; % Initializing Node count for all nodes (to keep track of nodes in X).
pcount=2; % Initializing Node count for open list (to keep track of nodes in open)
count=1;% Initialing parent node count.
closelist= [0 0];% Initializing Close list (it will store X and Y pos of nodes in closelist.

%% Main Loop

while(~isempty(open)) % Do only if there is a node availble in open list

[m,index]=min(cost); % Used to select the node in open list with minimum overall cost.
x= open(index,1); y= open(index,2);
[~,count]=ismember([x y],X,'rows');
[~,c2ccount]=ismember([x y],open,'rows');
if (abs(x-xgoal)< (resolution/100) && abs(y-ygoal)< (resolution/100))
    xgoal=x;ygoal=y;
    break
end
%% checking Upper node
xy=[x,y+resolution];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);


%% Checking Upper Right Node
xy=[x+resolution,y+resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);


%% Checking Right Node
xy=[x+resolution,y];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);

%% Checking Down Right Node
xy=[x+resolution,y-resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);

%% Checking Down Node.
xy=[x,y-resolution];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);

%% Checking Down Left Node.
xy=[x-resolution,y-resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);

%% Checking Left Node
xy=[x-resolution,y];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);

%% Checking Upper Left Node
xy=[x-resolution,y+resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution);

%% Popping out Current Node out of open list
cost(index)=[];
open(index,:)=[];
c2c(index)=[];
pcount=pcount-1;
%% Adding the popped out node in close list
closelist= [x y;closelist];
end


%% Back Tracking the parent node to find the path
fin=0;l=1;
[~, ncountfinal]= ismember([xgoal,ygoal],X,'rows');
ncount=ncountfinal;
plt=X(ncount,:);
hold on
% plot(plt(1),plt(2),'*'); % Plotting the newley discovered closest node.
rectangle('Position',[plt(1) plt(2) resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.

count= Pnode(1,2,ncount);
plt=X(count,:);
% plot(plt(1),plt(2),'*'); % Plotting the newley discovered closest node.
rectangle('Position',[plt(1) plt(2) resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.

while(fin==0)
    count= Pnode(1,2,count);
    plt= X(count,:);
    if(plt(1)==xstart && plt(2)==ystart)
        fin=1;
    end
rectangle('Position',[plt(1) plt(2) resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.
%     plot(plt(1),plt(2),'*'); % Plotting the newley discovered closest node.

% pause(0.002);

end
toc
button = questdlg('Do you Want to try again');

if (strcmp(button,'Cancel') || strcmp(button,'No'))
    close all;
    break;
else
    close all;clc;clear all;
    button='Yes';
end
 end







