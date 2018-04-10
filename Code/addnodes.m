function [X,Pnode,ncount,count,v,o,Cost]= addnodes(X,Pnode,ncount,count,v,o,resolution,xstart,ystart,xgoal,ygoal,Cost)
%This function is used to add nodes if possible in all 8 directions. Here,
%I only decide in which order should the node exploration should be carried
%out. Using hapf planes, there are 8 possible areas, 2 in each quadrant and
%accordingly 8 ifelse statements are used.


%% Add nodes

c=0;% Used to identify if any or all 8 nodes have been added to the current list of nodes.
x= X(1,1,o); y= X(1,2,o);
%% checking Upper node
if (checkforexist(x,y+resolution))
    xy= [x,(y+resolution)];
%     n=getn(x,y+resolution);
%     if (~(any(v== n)))                                  
        X(:,:,ncount)= xy;
        c2c=10;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=1;
        end
        ncount=ncount+1;
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);

            
%         v(ncount)= n;
%          if(any(v==ngoal))
%              return
%          end
         
    %     end
end
%% Checking Upper Right Node
if (checkforexist(x+resolution,y+resolution))
    xy= [(x+resolution),(y+resolution)];
%     n=getn(x+resolution,y+resolution);
        X(:,:,ncount)= xy;
        c2c=14;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=2;
        end
        ncount=ncount+1;
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);

%     end
end


%% Checking Right Node
if (checkforexist(x+resolution,y))
    xy= [(x+resolution),y];
%     n=getn(x+resolution,y);
%     if (~(any(v== n)))
        X(:,:,ncount)= xy;
        c2c=10;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=3;
        end
       ncount=ncount+1;

%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
%     end
end
%% Checking Down Right Node
if (checkforexist(x+resolution,y-resolution))
    xy= [(x+resolution),(y-resolution)];
%     n=getn(x+resolution,y-resolution);
%     if (~(any(v== n)))
         X(:,:,ncount)= xy;
        c2c=14;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=4;
        end
        ncount=ncount+1;
        
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
%     end
end
%% Checking Down Node.
if (checkforexist(x,y-resolution))
    xy= [x,(y-resolution)];
%     n=getn(x,y-resolution);
%     if (~(any(v== n)))
         X(:,:,ncount)= xy;
        c2c=10;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=5;
        end
        ncount=ncount+1;
       
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
%     end
end
%% Checking Down Left Node.
if (checkforexist(x-resolution,y-resolution))
    xy= [(x-resolution),(y-resolution)];
         X(:,:,ncount)= xy;
        c2c=14;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=6;
        end
        ncount=ncount+1;
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
%     end
end
%% Checking Left Node
if (checkforexist(x-resolution,y))
    xy= [(x-resolution),y];
%         X(:,:,ncount)= xy;
        c2c=14;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=7;
        end
        ncount=ncount+1;
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
%     end
end
%% Checking Upper Left Node
if (checkforexist(x-resolution,y+resolution))
    xy= [(x-resolution),(y+resolution)];
         X(:,:,ncount)= xy;
        c2c=14;
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
        if (totcost<Cost(:,:,ncount))
            Cost(:,:,ncount)=totcost;
            Pnode(:,:,ncount)= [ncount,count];
            c=8;
        end
        ncount=ncount+1;
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
%     end      
end 


   
 if(c>0 && c<9)
     count=count+1;
 end
 if(c==0)
     count=count+1;
 end





















% 
% theta= atan2((ygoal-ystart),(xgoal-xstart));
% theta= radtodeg(theta);%% Get the slope or angle wrt x axis
% 
% %The node exploration starts either from top, left,right or down node in
% %clockwise or anticlockwise direction. The direction is suggested by the
% %name of the function.
% 
% if (xgoal>=xstart && ygoal>=ystart && theta>=45 && theta<=90)
%     [X,Pnode,ncount,count,v,o]= topclock(X,Pnode,ncount,count,v,o,resolution);
% elseif (xgoal>=xstart && ygoal>=ystart && theta>=0 && theta<45)
%     [X,Pnode,ncount,count,v,o]= rightanticlock(X,Pnode,ncount,count,v,o,resolution);
% elseif(xgoal>=xstart && ygoal<ystart&& theta<0 && theta>=-45)
%     [X,Pnode,ncount,count,v,o]= rightclock(X,Pnode,ncount,count,v,o,resolution);
% elseif(xgoal>=xstart && ygoal<ystart&& theta<-45 && theta>=-90)
%     [X,Pnode,ncount,count,v,o]= downanticlock(X,Pnode,ncount,count,v,o,resolution);
% elseif(xgoal<=xstart && ygoal>=ystart && theta>90 && theta<=135)
%     [X,Pnode,ncount,count,v,o]= topanticlock(X,Pnode,ncount,count,v,o,resolution);
% elseif(xgoal<=xstart && ygoal>=ystart && theta>135 && theta<=180)
%     [X,Pnode,ncount,count,v,o]= leftclock(X,Pnode,ncount,count,v,o,resolution);
% elseif(xgoal<=xstart && ygoal<=ystart && theta>-180 && theta<=-135)
%     [X,Pnode,ncount,count,v,o]= leftanticlock(X,Pnode,ncount,count,v,o,resolution);
% elseif(xgoal<=xstart && ygoal<=ystart && theta>-135 && theta<-90)
%     [X,Pnode,ncount,count,v,o]= downclock(X,Pnode,ncount,count,v,o,resolution);
% end







end