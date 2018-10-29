
%% read images
img1 = imread('image1.png');
img2 = imread('image2.png');
load mask1.mat;
load mask2.mat;

%% Seam Estimation
[msk1, msk2, seam]=SeamEstimation(img1, img2, mask1, mask2);

%% Show resaults
figure, imshow(msk1);
figure, imshow(msk2);
figure, imshow(seam * 250);

stitched_image=repmat(uint8(msk1),[1,1,3]).*img1+repmat(uint8(msk2),[1,1,3]).*img2;
figure, imshow(stitched_image);