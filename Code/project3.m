 %% Anirudh Topiwala
 %Project 3.
clc;clear all;close all;

%Here NodeSet is represented by X array.
% Ans NodesInfoSet is represented by Pnode. 
 
 % This is the main function. Here we run breadth first search algorith to
 % find the shortest Path to reach the goal node.
 button='Yes';  % This is to restart with a new set of (xstart,ystart) and (xgoal,ygoal)
 while(strcmp(button,'Yes'))

 
 %% Draw GUI = World space with Obstacles
rows=150;cols=250;resolution=1; %Resolution can be changed depending on User. Please note that with increase in resolution, path found may slightly go into the obstacles. I recommend to keep resolution as 1
% map = robotics.BinaryOccupancyGrid(rows,cols,resolution,'grid');
% figure('units','normalized','outerposition',[0 0 1 1])
hold on
% show(map);
title('Click a point in the world space to set starting point for the path plan!!');
% grid on
axis([1 250 1 150])
% set(gca,'xtick',0:10:250,'ytick',0:10:150)
ax = gca;
ax.XTick = [0:20:250];
ax.YTick = [0:20:150];
% grid on
% grid minor
xsquare= [55,55,105,105];
ysquare=[67.5,112.5,112.5,67.5];
xcircle=180;ycircle=120;r=15;
xpolygon=[120,158, 165,188,168,145];
ypolygon=[55,51,89,51,14,14];

fill(xsquare,ysquare,'b');
fill(xpolygon,ypolygon,'b');
drawcircle(xcircle,ycircle,r);
% hold off;

%% Taking Input from User

% [xgoal,ygoal] = ginput(1);
% xgoal=121;ygoal=104;
check=1;
while(check==1) %While loop to check if values of (xstart,ystart,xgoal,ygoal) are valid or not.
title('Click a point in the world space to set starting point for the path plan!!');
% [xstart,ystart]=ginput(1);
xstart=0; ystart=0;
xstart=round(xstart); 
ystart=round(ystart);
xstart=xstart-mod(xstart,resolution); % This is done to adjust values according to resolution.
ystart=ystart-mod(ystart,resolution);% This is done to adjust values according to resolution.
title('Click a point in the world space to set end point for the path plan!!');
% [xgoal,ygoal] = ginput(1);
xgoal=4;ygoal=4;
xgoal=round(xgoal);
ygoal=round(ygoal);
xgoal=xgoal-mod(xgoal,resolution);% This is done to adjust values according to resoltion.
ygoal=ygoal-mod(ygoal,resolution);% This is done to adjust values according to resoltion.
    if(~(checkforexist(xstart,ystart)))
        uiwait(msgbox('Inavalid Start Point Input. Click a point inside the valid workspace'));
    elseif(~(checkforexist(xgoal,ygoal)))
         uiwait(msgbox('Inavalid End Point Input. Click a point inside the valid workspace'));
    else
         check=0;
    end
end
% % rectangle('Position',[xstart ystart resolution resolution ], 'FaceColor','red','EdgeColor','k');
% % rectangle('Position',[xgoal ygoal resolution resolution ], 'FaceColor','blue','EdgeColor','k');


%% Initializing Variables
ngoal=getn(round(xgoal),round(ygoal)); %Using getn to get unique ID for x and y input
d=1; % Initializing distance for while loop.
o=1;% Intializing counter for storing values in xplot and yplot.
X(:,:,1)= [xstart,ystart]; % Initializing the Nodes storage X.
% X(:,:,1)= [0,0]; % Initializing the Nodes storage X.
% Pnode(:,:,1)=[1 ,1]; % Intializing the parentnode storage. (Not required

Pnode(:,:,1)=[1 1]; % Intializing the parentnode storage. (Not required

% here as I am taking the shortest path by xnew and ynew values which will
% give me the closet node discovered to goal node.
ncount=2; % Initializing Node count.
count=1;% Initialing parent node count.
v=getn(xstart,ystart); %Initializing variabe to store all explored nodes.
Cost(:,:,1:80000)=inf;
Cost(:,:,1)=0;

%% Implemneting BFS
while (~(any(v==ngoal)))
        [X,Pnode,ncount,count,v,o,Cost]= addnodes(X,Pnode,ncount,count,v,o,resolution,xstart,ystart,xgoal,ygoal,Cost);
         o=o+1;
%         pause(0.001);
end

%% Back Tracking the parent node to find the path
    
fin=0;k=1;l=3; ncount= ncount-1; count=count-1;
path(1)= ncount;
xplot= X(1,1,path(1));yplot= X(1,2,path(1));
rectangle('Position',[xplot yplot resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.

path(2)=count;
xplot= X(1,1,path(2));yplot= X(1,2,path(2));
rectangle('Position',[xplot yplot resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.

while(fin==0)
    path(l)= Pnode(1,2,count);
    count= Pnode(1,2,count);
    xplot(k)= X(1,1,path(l));yplot(k)= X(1,2,path(l));
    if(xplot(k)==xstart && yplot(k)==ystart)
        fin=1;
    end
rectangle('Position',[xplot(k) yplot(k) resolution resolution ], 'FaceColor','green','EdgeColor','k');
% pause(0.002);
k=k+1;
l=l+1;

end

button = questdlg('Do you Want to try again');

if (strcmp(button,'Cancel') || strcmp(button,'No'))
    close all;
    break;
else
    close all;clc;clear all;
    button='Yes';
end
end








