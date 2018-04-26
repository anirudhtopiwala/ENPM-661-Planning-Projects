%% Anirudh Topiwala (UID: 115192386)
%% Project 3. (part 1)
function [X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,c2ccount,count,pcount,nodenum,open,cost,c2c,c,resolution)
 % This function is used to add node depending upon conditions listed

if (checkforexist(xy(1),xy(2), resolution))       %check for collision
   if (~ismember([xy(1) xy(2)],closelist,'rows')) %check if node not in close list
       % Calculating Cost to come 
        if(nodenum==1)
              c2c(pcount) = c2c(c2ccount) +10*resolution;
        else
              c2c(pcount)= c2c(c2ccount) +14*resolution;
        end
        
        % Calculating Cost to Go 
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        
        %Overall Cost
        totcost= c2c(pcount)+c2g;
        
        % Condition to check if c2c of current node is lees than c2c of the
        % same node in open list.
        
        if (ismember([xy(1) xy(2)],open,'rows'))      
%           [~,indexX]= ismember([xy(1) xy(2)],X,'rows');
            [~,indexo]= ismember([xy(1) xy(2)],open,'rows');
            if (c2c(pcount)< c2c(indexo))
                Pnode(:,:,ncount)=[ncount,count];
                cost(indexo)=totcost;
                c2c(indexo)=c2c(pcount);
            else
                
                Pnode(:,:,ncount)= [ncount,0];
            end
            
        else
            cost(pcount)= totcost;
            Pnode(:,:,ncount)= [ncount,count];
            open=[open; xy(1) xy(2)];
            c=[c ,c2c(pcount)];
            X= [X;xy(1) xy(2)];        
            pcount=pcount+1;
            ncount=ncount+1;

        end
        
        % To Visualize output
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);              
            
  end
         
 end
end

