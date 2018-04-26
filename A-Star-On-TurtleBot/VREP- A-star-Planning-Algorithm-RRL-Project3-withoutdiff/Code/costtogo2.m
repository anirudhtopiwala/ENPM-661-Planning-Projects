%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 2)
function [c2g] = costtogo2(x,y,xgoal,ygoal)
% This function is used to calculate cost to go

% x=0;y=1; xgoal=4;ygoal=4;
%% Eucledian Distance

c2g= sqrt( (x-xgoal)^2 + (y-ygoal)^2); 
%% Manhattan Distance


% diagdist= min( abs(xgoal-x) , abs(ygoal-y));
% edgedist= max(abs(xgoal-x) , abs(ygoal-y));
% 
% c2g= diagdist*14 + (edgedist-diagdist)*10;


end