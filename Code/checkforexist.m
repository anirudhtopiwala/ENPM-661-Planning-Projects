function [exist]= checkforexist(x,y)
% x=x-1;y=y-1;
% This is function is used to check if the point (x,y) is inside the valid
% worldspace.
%% Defining Obstacles.
% xsquare= [55,55,105,105];
% ysquare=[67.5,112.5,112.5,67.5];
% xcircle=180;ycircle=120;r=15;
% xpolygon=[120,158, 165,188,168,145];
% ypolygon=[55,51,89,51,14,14];
v= ((x-180)*(x-180)+ (y-120)*(y-120) - 15.5*15.5); %% Used to calculate if point is inside circle or not.

% Writing down the five equaltion of line of the polygon
% Line 2 with coordinates (120,55) and (145,14)
l1= (y-55)- (55-14)/(120-145)*(x-120);
% Line 2 with coordinates (145,14) and (168,14)
l2= (y-14);
% Line 3 with coordinates (168,14) and (188,51)
l3= -((y-51)- ((51-14)/(188-168))*(x-188));
% Line 4 with coordinates (188,51) and (165,89)
l4= (y-89)- (51-89)/(188-165)*(x-165);
% Line 5 with coordinates (158,51) and (165,89)
l5= -((y-89)- (51-89)/(158-165)*(x-165));
% Line 6 with coordinates (158,51) and (120,55)
l6= (y-51)- (51-55)/(158-120)*(x-158);




%% Checking Condition

if (x>=0 && x<=250 && y>=0 &&y<=150)
    % collision avoidance with sqaure
       if( x>=55 && x<=105 && y>67.5 && y<112.5  )
           exist = false;                           
    % collision avoidance with polygon
       elseif(l1>=0 && l2>=0 && l3<=0 && l4<=0 &&( l5>=0 || l6<=0))
%             if (l5>=0 || l6<=0)
             exist = false;
%             end
    % collision avoidance with circle
       elseif (v<=0)
        exist=false;
       else
        exist=true;
       end
else
    exist=false;
end  
       
end

