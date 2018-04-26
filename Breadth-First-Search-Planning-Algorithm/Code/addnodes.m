function [X,Pnode,ncount,count,v,o]= addnodes(X,Pnode,ncount,count,v,o,resolution,xstart,ystart,xgoal,ygoal)
%This function is used to add nodes if possible in all 8 directions. Here,
%I only decide in which order should the node exploration should be carried
%out. Using hapf planes, there are 8 possible areas, 2 in each quadrant and
%accordingly 8 ifelse statements are used.

theta= atan2((ygoal-ystart),(xgoal-xstart));
theta= radtodeg(theta);%% Get the slope or angle wrt x axis

%The node exploration starts either from top, left,right or down node in
%clockwise or anticlockwise direction. The direction is suggested by the
%name of the function.

if (xgoal>=xstart && ygoal>=ystart && theta>=45 && theta<=90)
    [X,Pnode,ncount,count,v,o]= topclock(X,Pnode,ncount,count,v,o,resolution);
elseif (xgoal>=xstart && ygoal>=ystart && theta>=0 && theta<45)
    [X,Pnode,ncount,count,v,o]= rightanticlock(X,Pnode,ncount,count,v,o,resolution);
elseif(xgoal>=xstart && ygoal<ystart&& theta<0 && theta>=-45)
    [X,Pnode,ncount,count,v,o]= rightclock(X,Pnode,ncount,count,v,o,resolution);
elseif(xgoal>=xstart && ygoal<ystart&& theta<-45 && theta>=-90)
    [X,Pnode,ncount,count,v,o]= downanticlock(X,Pnode,ncount,count,v,o,resolution);
elseif(xgoal<=xstart && ygoal>=ystart && theta>90 && theta<=135)
    [X,Pnode,ncount,count,v,o]= topanticlock(X,Pnode,ncount,count,v,o,resolution);
elseif(xgoal<=xstart && ygoal>=ystart && theta>135 && theta<=180)
    [X,Pnode,ncount,count,v,o]= leftclock(X,Pnode,ncount,count,v,o,resolution);
elseif(xgoal<=xstart && ygoal<=ystart && theta>-180 && theta<=-135)
    [X,Pnode,ncount,count,v,o]= leftanticlock(X,Pnode,ncount,count,v,o,resolution);
elseif(xgoal<=xstart && ygoal<=ystart && theta>-135 && theta<-90)
    [X,Pnode,ncount,count,v,o]= downclock(X,Pnode,ncount,count,v,o,resolution);
end




end