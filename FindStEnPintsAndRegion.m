function [points, im1, im2, mask, Dx, Dy, Err]=FindStEnPintsAndRegion(img1, img2, mask1, mask2)
    
    Err = 0;
    mask=mask1.*mask2;
    %Region
    x=max(mask);
    [a,I]=max(x);
    x(1,1:I)=1;
    [a,I2]=min(x);
    if I2==1
        I2=size(mask,2);
    end
    x=max(mask');
    [a,I3]=max(x);
    x(1,1:I3)=1;
    [a,I4]=min(x);
    if I4==1
        I4=size(mask,1);
    end
    I2=I2-1;
    I4=I4-1;
    
    im1=img1(I3:I4,I:I2,:);
    im2=img2(I3:I4,I:I2,:);
    mask=mask(I3:I4,I:I2);

    Dx=I-1; %Col
    Dy=I3-1;%Row
    
    % points 
    mask1=bwmorph(mask1,'remove');
    mask2=bwmorph(mask2,'remove');
    msk=uint8(mask1.*mask2);
    
    CC=bwconncomp(msk(I3:I4,I:I2));
    points=[];
    
    %   if (CC.NumObjects > 2)
    %  Err : intersection points are more than 2     
    
    for i=1:CC.NumObjects
        tmp=zeros(size(mask));
        tmp(CC.PixelIdxList{1,i})=1;
        points(:,:,i)=tmp;
    end
%     
%     [x,y]=find(msk>0);
%     points=[x,y]; 
% 
%     points(:,1)=points(:,1)-Dy;
%     points(:,2)=points(:,2)-Dx;    

end