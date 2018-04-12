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
figure('units','normalized','outerposition',[0 0 1 1])
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
[xstart,ystart]=ginput(1);
% xstarrt=2; ystart=3;
xstart=round(xstart); 
ystart=round(ystart);
xstart=xstart-mod(xstart,resolution); % This is done to adjust values according to resolution.
ystart=ystart-mod(ystart,resolution);% This is done to adjust values according to resolution.
title('Click a point in the world space to set end point for the path plan!!');
[xgoal,ygoal] = ginput(1);
% xgoal=4;ygoal=8;
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
rectangle('Position',[xstart ystart resolution resolution ], 'FaceColor','red','EdgeColor','k');
rectangle('Position',[xgoal ygoal resolution resolution ], 'FaceColor','blue','EdgeColor','k');
%% Initialize
% xstart=1; ystart=1; xgoal=48;ygoal=56;
open= [xstart,ystart]; % Initializing the Nodes storage X.
X=[xstart,ystart];
cost(1)= 0;
c=0;
c2c(1)=0;
Pnode(:,:,1)=[1 1]; % Intializing the parentnode storage. (Not required
ncount=2; % Initializing Node count.
count=1;% Initialing parent node count.
k=1;
pcount=2;


closelist= [0 0];
resolution=1;
while(~isempty(open))

[m,index]=min(cost);
x= open(index,1); y= open(index,2);
[~,count]=ismember([x y],X,'rows');

if (x==xgoal && y==ygoal)
    break
end
%% checking Upper node
xy=[x,y+resolution];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);


%% Checking Upper Right Node
xy=[x+resolution,y+resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);


%% Checking Right Node
xy=[x+resolution,y];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);

%% Checking Down Right Node
xy=[x+resolution,y-resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);

%% Checking Down Node.
xy=[x,y-resolution];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);

%% Checking Down Left Node.
xy=[x-resolution,y-resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);

%% Checking Left Node
xy=[x-resolution,y];
nodenum=1;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);

%% Checking Upper Left Node
xy=[x-resolution,y+resolution];
nodenum=0;
[X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c);




%% Popping out of open list
cost(index)=[];
open(index,:)=[];
c2c(index)=[];
pcount=pcount-1;
%% Adding in close list
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

pause(0.002);

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





