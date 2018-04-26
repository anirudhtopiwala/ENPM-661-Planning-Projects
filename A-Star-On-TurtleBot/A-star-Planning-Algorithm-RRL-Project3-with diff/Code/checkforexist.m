%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 1)
function [exist]= checkforexist(x,y,resolution)
% x=x-1;y=y-1;
% This is function is used to check if the point (x,y) is inside the valid
% worldspace.
%% Defining Obstacles.

d=0.2+resolution;

c61= ((x-6.3525)*(x-6.3525)+ (y-5.8)*(y-5.8) - (0.8+d)*(0.8+d)); %% Used to calculate if point is inside circle 6 upper half or not.
c62= ((x-6.3525)*(x-6.3525)+ (y-4.2)*(y-4.2) - (0.8+d)*(0.8+d)); %% Used to calculate if point is inside circle 6 lower half or not.

c71= ((x-10.1)*(x-10.1)+ (y-5.8)*(y-5.8) - (0.8+d)*(0.8+d)); %% Used to calculate if point is inside circle 7 upper half or not.
c72= ((x-10.1)*(x-10.1)+ (y-4.2)*(y-4.2) - (0.8+d)*(0.8+d)); %% Used to calculate if point is inside circle 7 lower half or not.




%% Checking Condition
% Checking if point is in world space.
if (x>=0 && x<=15-d && y>=0+d &&y<=10-d)
    % collision avoidance with sqaure 1
       if( x>=1.575-d && x<=2.375+d && y>=7.375-d && y<=9.375+d)
           exist = false; 
     % collision avoidance with sqaure 2
       elseif( x>=2.775-d && x<=3.575+d && y>=7.375-d && y<=9.375+d)
           exist = false;  
     % collision avoidance with sqaure 3
       elseif( x>=12.05-d && x<=13.65 +d && y>=8.55-d && y<=9.65+d)
           exist = false;    
     % collision avoidance with sqaure 4 and 5
       elseif( x>=14.05-d && x<=14.85+d && y>=2.275-d && y<=6.275+d)
           exist = false;    
     % collision avoidance with sqaure of object 6
       elseif( x>=5.5525-d && x<=7.1525 +d && y>=4.2-d && y<=5.8+d)
           exist = false;              
     % collision avoidance with sqaure of object 7
       elseif( x>=9.3-d && x<=10.9 +d && y>=4.2-d && y<=5.8+d)
           exist = false;              
    % collision avoidance with circle 6 upper half.
       elseif (c61<=0)
        exist=false;
    % collision avoidance with circle 6 lower half.
       elseif (c62<=0)
        exist=false;
    % collision avoidance with circle 7 upper half.
       elseif (c71<=0)
        exist=false;
    % collision avoidance with circle 7 lower half.
       elseif (c72<=0)
        exist=false;       
       else
        exist=true;
       end
else
    exist=false;
end  
       
end

