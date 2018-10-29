function dis=CalDist3(dif2,w,pnts)
% tic 
% dis=0;
t=w;
% w=w+dif2;
x1 = pnts(1,1);
y1 = pnts(1,2);
x2 = pnts(2,1);
y2 = pnts(2,2);    
    [m,n]=size(dif2);
    idx1=[];
%     idx2=[];
%     d=dif2+d3;
%     d(d>1)=1;
    val=dif2;
    p=[x2 ,y2];
    idx1=[idx1;p];
%     idx1=[idx1;[x1,y1]];
    while 1
        
        idxVal1=calidxVal3(p,val,m,n,t,[x1,y1]);
        mp = [floor((idxVal1(1,1:2)+p)/2)];
        
        val(p(1,1),p(1,2))=val(p(1,1),p(1,2))+0.001;
        val(mp(1,1),mp(1,2))=val(mp(1,1),mp(1,2))+0.001;
        t(p(1,1),p(1,2))=t(p(1,1),p(1,2))+0.001;
        t(mp(1,1),mp(1,2))=t(mp(1,1),mp(1,2))+0.001;
        
        idx1=[idx1;p;mp];

        s=intersect(x1,idxVal1(1,1));        
        if size(s,1)>0 && size(s,2)>0
            s=intersect(y1,idxVal1(1,2));        
            if size(s,1)>0 && size(s,2)>0
                break;
            end
        end
     
        p=idxVal1(:,1:2);
        
    end
      
    idx1=[idx1;[x1,y1]];
    q=zeros(size(dif2));
    for i=1:size(idx1,1)
        q(idx1(i,1),idx1(i,2))=1;
    end
%      figure,imshow(q);
    dis=bwmorph(q,'dilate');
%     dis=bwmorph(dis,'thin');

% toc
end