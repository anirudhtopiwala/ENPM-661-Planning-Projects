%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 2)
function [] = drawobstaclespace()

 %% Draw GUI = World space with Obstacles
 
 figure('units','normalized','outerposition',[0 0 1 1])
hold on
title('Click a point in the world space to set starting point for the path plan!!');
% grid on
axis([1 15 1 10])
% set(gca,'xtick',0:10:250,'ytick',0:10:150)
ax = gca;
ax.XTick = [0:0.5:15];
ax.YTick = [0:0.5:10];
% grid on
% grid minor

% Square 1
xsquare1= [1.575,1.575,2.375,2.375];
ysquare1=[7.375,9.375,9.375,7.375];

% Square 2
xsquare2= [2.775,2.775,3.575,3.575];
ysquare2=[7.375,9.375,9.375,7.375];

% Square 3
xsquare3= [12.05,12.05,13.65,13.65];
ysquare3=[8.55,9.65,9.65,8.55];

% Square 4
xsquare4= [14.05,14.05,14.85,14.85];
ysquare4=[4.275,6.275,6.275,4.275];

% Square 5
xsquare5= [14.05,14.05,14.85,14.85];
ysquare5=[2.275,4.275,4.275,2.275];

% Square 6
xsquare6= [5.5525,5.5525,7.1525,7.1525];
ysquare6=[4.2,5.8,5.8,4.2];

% Square 7
xsquare7= [9.3,9.3,10.9,10.9];
ysquare7=[4.2,5.8,5.8,4.2];

% Circle 6 and 7
r= 0.8;
xc61= 6.3525; yc61= 5.8; 
xc62= 6.3525; yc62= 4.2;

xc71= 10.1; yc71= 5.8; 
xc72= 10.1; yc72= 4.2;



% Draw


filledCircle([xc61,yc61],r,1000,'b'); 
filledCircle([xc62,yc62],r,1000,'b'); 
filledCircle([xc71,yc71],r,1000,'b'); 
filledCircle([xc72,yc72],r,1000,'b'); 



fill(xsquare1,ysquare1,'b');
fill(xsquare2,ysquare2,'b');
fill(xsquare3,ysquare3,'b');
fill(xsquare4,ysquare4,'b');
fill(xsquare5,ysquare5,'b');
fill(xsquare6,ysquare6,'b');
fill(xsquare7,ysquare7,'b');


% drawcircle(xc61,yc61,r);
% drawcircle(xc62,yc62,r);
% drawcircle(xc71,yc71,r);
% drawcircle(xc72,yc72,r);






% hold off;






end