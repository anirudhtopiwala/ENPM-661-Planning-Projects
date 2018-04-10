function [X,Pnode,ncount,count,v,o]= leftanticlock(X,Pnode,ncount,count,v,o,resolution)
%This function is used to add nodes if possible in all 8 directions and
%then from the discovered nodes,find the closest node to goal node which
%will be (xnew,ynew).

c=0;% Used to identify if any or all 8 nodes have been added to the current list of nodes.
x= X(1,1,o); y= X(1,2,o);
%% Checking Left Node
if (checkforexist(x-resolution,y))
    xy= [(x-resolution),y];
    n=getn(x-resolution,y);
    if (~(any(v== n)))
        X(:,:,ncount)= xy;
        Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%         if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
        c=7;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
    end
end
%% Checking Down Left Node.
if (checkforexist(x-resolution,y-resolution))
    xy= [(x-resolution),(y-resolution)];
    n=getn(x-resolution,y-resolution);
    if (~(any(v== n)))
        X(:,:,ncount)= xy;
        Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%         if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
        c=6;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
    end
end
%% Checking Down Node.
if (checkforexist(x,y-resolution))
    xy= [x,(y-resolution)];
    n=getn(x,y-resolution);
    if (~(any(v== n)))
        X(:,:,ncount)= xy;
        Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%         if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
        c=5;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
    end
end
%% Checking Down Right Node
if (checkforexist(x+resolution,y-resolution))
    xy= [(x+resolution),(y-resolution)];
    n=getn(x+resolution,y-resolution);
    if (~(any(v== n)))
        X(:,:,ncount)= xy;
        Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%         if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
        c=4;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
    end
end
%% Checking Right Node
if (checkforexist(x+resolution,y))
    xy= [(x+resolution),y];
    n=getn(x+resolution,y);
    if (~(any(v== n)))
        X(:,:,ncount)= xy;
        Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%         if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
        c=3;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
    end
end
%% Checking Upper Right Node
if (checkforexist(x+resolution,y+resolution))
    xy= [(x+resolution),(y+resolution)];
    n=getn(x+resolution,y+resolution);
    if (~(any(v== n)))
        X(:,:,ncount)= xy;
        Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%         if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
        c=2;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);

    end
end
%% checking Upper node
if (checkforexist(x,y+resolution))
    xy= [x,(y+resolution)];
    n=getn(x,y+resolution);
    if (~(any(v== n)))                                  
        X(:,:,ncount)= xy;
      Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%          if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
         c=1;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
        

    end
end
%% Checking Upper Left Node
if (checkforexist(x-resolution,y+resolution))
    xy= [(x-resolution),(y+resolution)];
    n=getn(x-resolution,y+resolution);
    if (~(any(v== n)))
        X(:,:,ncount)= xy;
        Pnode(:,:,ncount)= [ncount,count];
        v(ncount)= n;
%         if(any(v==ngoal))
%              return
%          end
        ncount=ncount+1;
        c=8;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);
    end      
end 




 if(c>0 && c<9)
     count=count+1;
 end
 if(c==0)
     count=count+1;
 end

end