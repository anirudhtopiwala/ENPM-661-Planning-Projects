function [c2g] = costtogo2(x,y,xgoal,ygoal)
% x=0;y=1; xgoal=4;ygoal=4;

% c2g= sqrt( (x-xgoal)^2 + (y-ygoal)^2); 

diagdist= min( abs(xgoal-x) , abs(ygoal-y));
edgedist= max(abs(xgoal-x) , abs(ygoal-y));

c2g= diagdist*14 + (edgedist-diagdist)*10;


end
