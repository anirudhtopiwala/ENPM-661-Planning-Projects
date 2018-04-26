%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 2)- Vrep
function [path]= project3withoutdiffconstraints(xstart,ystart,resolution)

% This Function is used to generate path according to the inputs given from
% vrep.
 
 %% Draw GUI = World space with Obstacles
drawobstaclespace();

%% Taking Input from User
% Taking G-input for output point
check=1;
while(check==1) %While loop to check if values of (xstart,ystart,xgoal,ygoal) are valid or not.

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
%% Initialize
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
path(l,:)=[plt(1) plt(2)];l=l+1;
count= Pnode(1,2,ncount);
plt=X(count,:);
% plot(plt(1),plt(2),'*'); % Plotting the newley discovered closest node.
rectangle('Position',[plt(1) plt(2) resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.
path(l,:)=[plt(1) plt(2)];l=l+1;

while(fin==0)
    count= Pnode(1,2,count);
    plt= X(count,:);
    if(plt(1)==xstart && plt(2)==ystart)
        fin=1;
    end
rectangle('Position',[plt(1) plt(2) resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.
path(l,:)=[plt(1) plt(2)];l=l+1;

%     plot(plt(1),plt(2),'*'); % Plotting the newley discovered closest node.

pause(0.002);

end
% toc
path= flipud(path);
newxtheta(1)=0; newxtheta(2)= atan2((path(2,2)-path((2-1),2)),(path(2,1)-path((2-1),1)));
ind=[];

for i=3:size(path,1)
    
   newxtheta(i)= atan2((path(i,2)-path((i-1),2)),(path(i,1)-path((i-1),1)));
  if (newxtheta(i-2)==newxtheta(i-1) && newxtheta(i-1)==newxtheta(i))
      ind=[ ind, i-1];
  end
end
path(ind,:)=[];

 end







