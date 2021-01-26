    % 1.2 ?? 3.2 3.3 4.1 4.2 without water mark
    %3.1 1.1 1.3 with watermark 
    %case2 deleted
% any img the shooting is bright the threesholding is 0.6 and the dark is
% 0.1 


%{
case1
1- image <--1.1.jpeg--> after remove water mark
2- the image is BW image and thresholding =0.1
3- range of shoots = [12 60] 
4- hough transform success
 se = strel('disk',4);
 temp = imerode(temp,se);


1- image <--1.2.jpg--> havenot noise or water? mark 
2- the image is BW image and thresholding =0.1
3- range of shoots = [12 60] 
4- hough transform success
%  se = strel('disk', 17);
%  temp = imclose(temp,se);


1- image <--1.3.jpeg--> after remove water mark
2- the image is BW image and thresholding =0.1
3- range of shoots = [12 60] 
4- hough transform success
 se = strel('disk',4);
 temp = imerode(temp,se);
5-to get ranges the threshold is 
temp=gray>200;

case3 
1- image <--3.2.png--> havenot noise or water? mark 
2- the image is BW image and thresholding =0.1
3- range of shoots = [12 60] 
4- hough transform success
 se = strel('disk',4);
 temp = imerode(temp,se);

case 3
1- image <--3.3.png--> havenot noise or water mark 
2- the image is BW image and thresholding =0.6
3- range of shoots = [12 60]
4- but should make ~ to the image because hough transform detect only black
or make that<--bright--> instead of dark
circles in BW images
5- hough transform success
 se = strel('disk',4);
 temp = imerode(temp,se);

 se = strel('disk', 17);
 temp = imclose(temp,se);

6- to get the ranges threshold is 
temp=gray>149;

case4

1- image <--4.1.jpg--> havenot noise or water mark 
2- the image is BW image and thresholding =0.6
3- range of shoots = [12 60]
4- but should make ~ to the image because hough transform detect only black
or make that <--bright--> instead of dark
circles in BW images
5- cannot detect all circles faiiiiiiiiiiiiiiil in all ^-^ 
                    <--(special case)-->
6-imgr=rgb2gray(B);
 temp=imgr>100;
se = strel('disk',8);
 temp = imopen(temp,se);
%  temp = imclose(temp,se);
   
[centers, radi,matrix] = imfindcircles(temp,[13 60],'ObjectPolarity','bright');%16 35
viscircles(centers, radi,'EdgeColor','b');



1- image <--4.2.jpg--> havenot noise or water mark 
2- the image is BW image and thresholding =0.6
3- range of shoots = [12 60]
4- but should make ~ to the image because hough transform detect only black
or make that <--bright--> instead of dark
circles in BW images
5- hough transform success 
6-threshold to detect number of ranges 0.3 or 0.2
 se = strel('disk',4);
 temp = imerode(temp,se);

 se = strel('disk', 17);
 temp = imclose(temp,se);

case 7
1-image <--7.1.jpg--> have water mark 
2- the image is BW image and thresholding =0.1
3- range of shoots = [16 35]
circles in BW images
4-should make preprocessing on it 
 se = strel('disk',4);
 temp = imerode(temp,se);
5- hough transform success  
%}



%{
we should make mask to fill the shoots with diffirent color about white and black 
to recognize only the ranges
%}
