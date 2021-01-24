    % 1.2 ?? 3.2 3.3 4.1 4.2 without water mark
    %3.1 1.1 1.3 with watermark 
    %case2 deleted
% any img the shooting is bright the threesholding is 0.6 and the dark is
% 0.1 


%{
case1
1- image <--1.2.jpg--> havenot noise or water? mark 
2- the image is BW image and thresholding =0.1
3- range of shoots = [12 60] 
4- hough transform success

case3 
1- image <--3.2.png--> havenot noise or water? mark 
2- the image is BW image and thresholding =0.1
3- range of shoots = [12 60] or 0.6 and [16 35]
4- hough transform success

case 3
1- image <--3.3.png--> havenot noise or water mark 
2- the image is BW image and thresholding =0.6
3- range of shoots = [16 35]
4- but should make ~ to the image because hough transform detect only black
or make that<--bright--> instead of dark
circles in BW images
5- hough transform success
% preprocessing to remove number noise
 B=rgb2gray(B);
 figure,imhist(B);
figure ,imshow(B);
[h,w,s]=size(B);
for o=1:h
    for k=1:w
     if(B(o,k,s)>50&&B(o,k,s)<150)
           
            B(o,k,s)=210;
     end
        
    end
end
figure ,imshow(B),title('removed');


case4

1- image <--4.1.jpg--> havenot noise or water mark 
2- the image is BW image and thresholding =0.6
3- range of shoots = [12 60]
4- but should make ~ to the image because hough transform detect only black
or make that <--bright--> instead of dark
circles in BW images
5- cannot detect all circles
6-imgr=rgb2gray(B);
 temp=imgr>100;
se = strel('disk',8);
 temp = imopen(temp,se);
%  temp = imclose(temp,se);
   
[centers, radi,matrix] = imfindcircles(temp,[13 60],'ObjectPolarity','bright');%16 35
viscircles(centers, radi,'EdgeColor','b');
 
should remove lines to detect right ranges by using filters and morphology
 m=Sobel('H');
 B=LinearFilter(B,m,'absolute');
 figure,imshow(B),title('sobel detect horizontal edges');
 filterWindow = ones(5)/ 25;
 I= imfilter(B, filterWindow);
 figure,imshow(I),title('mean filter');
 se1 = strel('line',9,25);
 I = imerode(I,se1);   
 se = strel('disk',15,0);
 I = imclose(I,se);
 figure ,imshow(I),title('closing filter');

1- image <--4.2.jpg--> havenot noise or water mark 
2- the image is BW image and thresholding =0.6
3- range of shoots = [12 60]
4- but should make ~ to the image because hough transform detect only black
or make that <--bright--> instead of dark
circles in BW images
5- hough transform success 
6-threshold to detect number of ranges 0.3 or 0.2


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
we should make mask to fil the shoots with diffirent color about whita and black 
to recognize only the ranges
%}
