function [mask1, mask2, seam]=SeamEstimation(img1, img2, mask1, mask2)

% This function estimates a seam between img1 and img2, that are tow images with the overlap region 
% input
% img1 and img2 : are warped images
% mask1 and mask2 : are amsk of warped images

% output
%mask1 and mask2 : are selected region from each image in the last output
%stitched image
%seam : is selected seam between tow images

ms1=mask1;
ms2=mask2;
   
% find start & end points to search a seam & select public region
 [points,im1,im2,mask,Dx,Dy]=FindStEnPintsAndRegion(img1,img2,mask1,mask2);       
      
    ColDif=abs(im2double(im1)-im2double(im2));
    m=min(ColDif,[],3);
    s=((sum(ColDif,3)-m)/2);
    ColDif=ColDif.*repmat(double(mask),[1,1,3]);
    a=(mean(max(ColDif,[],1))+mean(min(ColDif,[],1)))/2;
    b=(mean(max(ColDif,[],2))+mean(min(ColDif,[],2)))/2;
    max_=(a+b)/2;
    mask2=[];
    mask2(:,:,1)= ColDif(:,:,1) - max_(1,1,1);
    mask2(:,:,2)= ColDif(:,:,2) - max_(1,1,2);
    mask2(:,:,3)= ColDif(:,:,3) - max_(1,1,3);
    mask2(mask2<0)=0;  

    [msk,~]=ImgClassification2(im1,im2,mask2,mask,points,s);
%     tim=toc();
    
    seam=zeros(size(ms1));
    seam(Dy+1:size(msk,1)+Dy,Dx+1:size(msk,2)+Dx)=msk;
    
    seam=bwmorph(seam,'diag');
    seam=imfill(uint8(seam));
    
    mask1=ms1-seam;
    cc1=bwlabel(mask1);
    
    mask2=(ms2)-uint8(seam);
    cc2=bwlabel(mask2);
    
    m1=double(mask1-mask2).*cc1;
    m2=double(mask2-mask1).*cc2;

    u1=unique(m1);
    u2=unique(m2);
    
    mask1=zeros(size(mask1));
    mask2=zeros(size(mask2));
    
    mask1(cc1==u1(2))=1;
    mask2(cc2==u2(end))=1;
    mask1=mask1+double(seam);

end