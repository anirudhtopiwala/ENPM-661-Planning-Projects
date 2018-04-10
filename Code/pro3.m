clc;clear all; close all;
xstart=1; ystart=1; xgoal=2;ygoal=2;
pos(:,:,1)= [xstart,ystart]; % Initializing the Nodes storage X.
Pnode(:,:,1)=[1 1 0]; % Intializing the parentnode storage. (Not required
ncount=1; % Initializing Node count.
count=1;% Initialing parent node count.
% Cost(:,:,1:80000)=inf;
% Cost(:,:,1)=0;
Cost=0;
openlist= [xstart,ystart];
closelist= [];
resolution=1;
X=[1,1];
while(~isempty(openlist))

x= openlist(1,1); y= openlist(1,2);
closelist(count,:)= [x y];
openlist(1,:)=[];
if (x==xgoal && y==ygoal)
    break
end
k=ncount;
%% checking Upper node
xy=[x,y+resolution];
nodenum=1;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);


%% Checking Upper Right Node
xy=[x+resolution,y+resolution];
nodenum=0;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);


%% Checking Right Node
xy=[x+resolution,y];
nodenum=1;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);

%% Checking Down Right Node
xy=[x+resolution,y-resolution];
nodenum=0;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);

%% Checking Down Node.
xy=[x,y-resolution];
nodenum=1;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);

%% Checking Down Left Node.
xy=[x-resolution,y-resolution];
nodenum=0;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);

%% Checking Left Node
xy=[x-resolution,y];
nodenum=1;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);

%% Checking Upper Left Node
xy=[x-resolution,y+resolution];
nodenum=0;
[openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos);

count=count+1;
%  if(c>0 && c<9)
%      count=count+1;
%  end
%  if(c==0)
%      count=count+1;
%  end
end
%% Back Tracking the parent node to find the path
    
fin=0;k=1;l=3;
[M ncount ]=max(Pnode(1,3,:)); count=Pnode(1,2,ncount);
path(1)= ncount;
xplot= pos(1,1,path(1));yplot= pos(1,2,path(1));
hold on
% rectangle('Position',[xplot yplot resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.
plot(xplot,yplot,'*'); % Plotting the newley discovered closest node.

path(2)=count;
xplot= pos(1,1,path(2));yplot= pos(1,2,path(2));

% rectangle('Position',[xplot yplot resolution resolution ], 'FaceColor','green','EdgeColor','k'); %% Plotting explored Nodes.
plot(xplot,yplot,'*'); % Plotting the newley discovered closest node.

while(fin==0)
    path(l)= Pnode(1,2,count);
    count= Pnode(1,2,count);
    xplot(k)= pos(1,1,path(l));yplot(k)= pos(1,2,path(l));
    if(xplot(k)==xstart && yplot(k)==ystart)
        fin=1;
    end
% rectangle('Position',[xplot(k) yplot(k) resolution resolution ], 'FaceColor','green','EdgeColor','k');
plot(xplot,yplot,'*'); % Plotting the newley discovered closest node.

pause(0.002);
k=k+1;
l=l+1;

end
shaklaka=1;



