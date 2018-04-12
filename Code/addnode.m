%% 
function [X,Pnode,ncount,pcount,open,cost,c2c,c]=addnode(xy,X,closelist,Pnode,xgoal,ygoal,ncount,count,pcount,nodenum,open,cost,c2c,c)
resolution=1;
 if (checkforexist(xy(1),xy(2)))  
   if (~ismember([xy(1) xy(2)],closelist,'rows'))       
        if(nodenum==1)
%             c2c= Pnode(1,3,count)+10;
              c2c(pcount) = c(count) +10;
        else
%             c2c= Pnode(1,3,count)+ 14;
              c2c(pcount)= c(count) +14;
        end
        
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c(pcount)+c2g;
        
        c=[c ,c2c(pcount)];
        X= [X;xy(1) xy(2)];
        
        
        if (ismember([xy(1) xy(2)],open,'rows'))      
            [~,indexX]= ismember([xy(1) xy(2)],X,'rows');
            [~,indexo]= ismember([xy(1) xy(2)],open,'rows');
            if (c2c(pcount)< c(indexX))
                Pnode(:,:,ncount)=[ncount,count];
                cost(indexo)=totcost;
            else
                
                Pnode(:,:,ncount)= [ncount,0];
            end
            
        else
            cost(pcount)= totcost;
            Pnode(:,:,ncount)= [ncount,count];
            open=[open; xy(1) xy(2)];
            pcount=pcount+1;
        end
        
        ncount=ncount+1;
        rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);

      
                
            
  end
         
 end
end

