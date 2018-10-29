function idxVal=calidxVal3(p,val,m,n,w,endP)

        idx=[];
        t=2;        % t is [1-3]
        
        if p(1,1)-t>0 && w(p(1,1),p(1,2))>=w(p(1,1)-t,p(1,2))
            idx=[idx;p(1,1)-t,p(1,2),val(p(1,1)-t,p(1,2))];
        end
        % down
        if p(1,1)+t<=m && w(p(1,1),p(1,2))>=w(p(1,1)+t,p(1,2))
            idx=[idx;p(1,1)+t,p(1,2),val(p(1,1)+t,p(1,2))];            
        end
        % left
        if p(1,2)-t>0 && w(p(1,1),p(1,2))>=w(p(1,1),p(1,2)-t)
            idx=[idx;p(1,1),p(1,2)-t,val(p(1,1),p(1,2)-t)];
        end
        % right
        if p(1,2)+t<=n && w(p(1,1),p(1,2))>=w(p(1,1),p(1,2)+t)
            idx=[idx;p(1,1),p(1,2)+t,val(p(1,1),p(1,2)+t)];
        end
        % up left
        if p(1,1)-t>0 && p(1,2)-t>0 && w(p(1,1),p(1,2))>=w(p(1,1)-t,p(1,2)-t)
            idx=[idx;p(1,1)-t,p(1,2)-t,val(p(1,1)-t,p(1,2)-t)];
        end
        % down left
        if p(1,1)+t<=m && p(1,2)-t>0 && w(p(1,1),p(1,2))>=w(p(1,1)+t,p(1,2)-t)
            idx=[idx;p(1,1)+t,p(1,2)-t,val(p(1,1)+1,p(1,2)-t)];            
        end
        % up right
        if p(1,1)-t>0 && p(1,2)+t<=n && w(p(1,1),p(1,2))>=w(p(1,1)-t,p(1,2)+t)
            idx=[idx;p(1,1)-t,p(1,2)+t,val(p(1,1)-t,p(1,2)+t)];
        end
        % down right
        if p(1,1)+t<=m && p(1,2)+t<=n && w(p(1,1),p(1,2))>=w(p(1,1)+t,p(1,2)+t)
            idx=[idx;p(1,1)+t,p(1,2)+t,val(p(1,1)+t,p(1,2)+t)];
        end

         
        if size(idx,1)<1
         % up
        if p(1,1)-1>0
            idx=[idx;p(1,1)-1,p(1,2),val(p(1,1)-1,p(1,2))];
        end
        % down
        if p(1,1)+1<=m 
            idx=[idx;p(1,1)+1,p(1,2),val(p(1,1)+1,p(1,2))];            
        end
        % left
        if p(1,2)-1>0 
            idx=[idx;p(1,1),p(1,2)-1,val(p(1,1),p(1,2)-1)];
        end
        % right
        if p(1,2)+1<=n 
            idx=[idx;p(1,1),p(1,2)+1,val(p(1,1),p(1,2)+1)];
        end
        % up left
        if p(1,1)-1>0 && p(1,2)-1>0
            idx=[idx;p(1,1)-1,p(1,2)-1,val(p(1,1)-1,p(1,2)-1)];
        end
        % down left
        if p(1,1)+1<=m && p(1,2)-1>0
            idx=[idx;p(1,1)+1,p(1,2)-1,val(p(1,1)+1,p(1,2)-1)];            
        end
        % up right
        if p(1,1)-1>0 && p(1,2)+1<=n
            idx=[idx;p(1,1)-1,p(1,2)+1,val(p(1,1)-1,p(1,2)+1)];
        end
        % down right
        if p(1,1)+1<=m && p(1,2)+1<=n
            idx=[idx;p(1,1)+1,p(1,2)+1,val(p(1,1)+1,p(1,2)+1)];
        end
       end
        [~ , idxMin]=min(idx(:,3));
        idxVal=idx(idxMin,:);

end