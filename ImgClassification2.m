function [lbl1,lbl2]=ImgClassification2(im1,im2,mask,mask3,points,s)
    
% lbl1=[];
lbl2=[];
  
  mask2=rgb2gray(mask);
     mask2(mask2>0)=1;
%     mask2=bwareaopen(mask2,4);
     mask2=bwareaopen(mask2,2);

[gr1,~]=imgradient(rgb2gray(im1));
 gr1=mat2gray(gr1);
[gr2,~]=imgradient(rgb2gray(im2));
 gr2=mat2gray(gr2);
d=abs(gr1-gr2)+mask2+(1-double(mask3));
d(d>1)=1;
% u=zeros(size(d));
[x1,y1]=find(points(:,:,1)==1);
x1 = x1(ceil(size(x1,1)/2));
y1 = y1(ceil(size(y1,1)/2));
 [x2,y2]=find(points(:,:,2)==1);
 x2 = x2(ceil(size(x2,1)/2));
y2 = y2(ceil(size(y2,1)/2));
% b=abs(gr1-gr2);
% n = max(s,d);

  i=graydist(d,y1,x1,'cityblock'); %a+q
%   
%     i=graydist(s,y1,x1,'cityblock'); %a+q
    i = i/(max(max(i)));
    n=s.*0+0.00001;
    i2=graydist(n,y1,x1,'cityblock'); %a+q


%    lbl1=CalDist2(s+i2,i+i2,[x1,y1;x2,y2]); %
   lbl1=CalDist3(s+i2,i+i2,[x1,y1;x2,y2]); %

   return;
   
end