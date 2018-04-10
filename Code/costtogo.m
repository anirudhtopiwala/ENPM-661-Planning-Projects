function [c2g] = costtogo(x,y,xgoal,ygoal)
% xstart=2;ystart=2; xgoal=1;ygoal=2;
c2g=0; check=0;
if (x>xgoal && y>ygoal)
    tempx=xgoal; tempy= ygoal;
    xgoal=x; ygoal=y;
    x=tempx; y=tempx;
end
    
while (check==0)
 m= abs((ygoal-y)/(xgoal-x));
if(m~=1)
        y=y+1;
        c2g=c2g+10;
else
    c2g= c2g+ ((sqrt(((xgoal-x)^2 + (ygoal-y)^2)))/sqrt(2))*14;
    check=1;
end
if(abs(ygoal-y)==0)
    c2g=c2g+(xgoal-x)*10;
    check=1;
end
end



end
