%% 
function [openlist,Cost,Pnode,X,ncount,count,pos]=addnode(xy,X,openlist,closelist,Cost,Pnode,xgoal,ygoal,ncount,count,nodenum,pos)

if (checkforexist(xy(1),xy(2)))  
   if (~ismember([xy(1) xy(2)],closelist,'rows'))       
        if(nodenum==1)
            c2c= Pnode(1,3,count)+10;
        else
            c2c= Pnode(1,3,count)+ 14;
        end
        c2g= costtogo2(xy(1),xy(2),xgoal,ygoal);
        totcost= c2c+c2g;
      if (~ismember([xy(1) xy(2)],X,'rows'))
        X=[X;xy(1),xy(2)];
      end
       try
         check=Cost(xy(1),xy(2));
       catch
          Cost=accumarray(X,[reshape(Cost,[1 numel(Cost)]) inf]);
       end
        ncount=ncount+1;
        if (totcost<Cost(xy(1),xy(2))|| Cost(xy(1),xy(2))==0 )
%             Cost=accumarray(X,[Cost totcost]);
            Cost(xy(1),xy(2))=totcost;
            Pnode(:,:,ncount)= [ncount,count,c2c];
            [check, index]=ismember([xy(1) xy(2)],openlist,'rows');
            if(check)
                openlist(index,:)=[xy(1) xy(2)];
            else
            openlist=[openlist;xy(1) xy(2)];
            end

%             c=1;
        end
        pos(:,:,ncount)=[xy(1) xy(2)];
       
        
%         rectangle('Position',[xy(1) xy(2) resolution resolution ], 'FaceColor','yellow','EdgeColor','r');pause(0.0001);

   end     
end
end