%  str='3.2.png';   %3.2 doubleline effect 4.1 donot know 4.2 can be handeled
%  %in coordinates we should make vertical line to check if that outer
%  %background and detect that
%  B = imread(str); 
%  B=imresize(B,[1300,1300]);
% 
% pts = Getcenter(B,1);
% hn=floor(pts(2,1));
% wn=floor(pts(1,1)); 
% hf=floor(pts(2,2)
%  I=B;
%  [h,w,s]=size(I);
%  for i=wn:w
% %       for po=0:10
% %   
% %             I(hn-po,i,:)=I(hn-po,i,:)*0+I(hn-mod(i,30),i,:);%-3po
% %             I(hn+po,i,:)=I(hn+po,i,:)*0+I(hn-mod(i,30),i,:); 
% %  end
%  for po=0:10
% % wf=floor(pts(1,2));
% % B = GetCoordinates(B);
% 
% 
%   
%         I(hn-po,i,:)=I(hn-po,i,:)*0+I(hn-20+po,i,:);%-3po
%         I(hn+po,i,:)=I(hn+po,i,:)*0+I(hn-20+po,i,:);
%  end
%  end
%   
% %  I=imgaussfilt(I,0.8);
% %  I=imgaussfilt(I,0.8);
%  col=I;
%  gray=rgb2gray(I);
% %  I= edge(gray,'canny');
%  y = graythresh(gray);
%  level=0.6;
%  I=edge(gray,'Prewitt',0.04);
% %  I= bwmorph(I, 'Skel', inf);
%  I=im2bw(I,level);
% %   se=strel('line',15,20);
% %  I=impothat(I,se);
%  se=strel('disk',6);
%  I=imclose(I,se);
%  
%  
%   se=strel('disk',4);
%  I=imopen(I,se);
%  imshow(I);







% 
% 
% 
% 
 str='2.1.png';   %3.2 doubleline effect 4.1 donot know 4.2 can be handeled
 %in coordinates we should make vertical line to check if that outer
 %background and detect that
 B = imread(str); 
 B=imresize(B,[1300,1300]);
 

 
% hf=floor(pts(2,2));
% wf=floor(pts(1,2));
% B = GetCoordinates(B);


 I=B;
 [h,w,s]=size(I);
figure,imshow(I);
  
 I=imgaussfilt(I,0.8);
 I=imgaussfilt(I,0.8);
 col=I;
 gray=rgb2gray(I);
%  I= edge(gray,'canny');
 y = graythresh(gray);
 level=0.6;
 I=edge(gray,'Prewitt',0.04);
%  se=strel('disk',14);
%  I=imclose(I,se);
%  I=imtophat(I,se);
%   se=strel('disk',10);
%  I=imclose(I,se);
%  I= bwmorph(I, 'Skel', inf);
%  I=im2bw(I,level);
%  CC = bwconncomp(I)
 
%  [centers2, radi2,matrix2] = imfindcircles(I,[12 80],'ObjectPolarity','dark');%15 5000
%  viscircles(centers2, radi2,'EdgeColor','r')
% 
%  figure,imshow(I);
% numPixels = cellfun(@numel,CC.PixelIdxList);
% [biggest,idx] = max(numPixels);
% I(CC.PixelIdxList{idx}) = 0;
% 
%  figure,imshow(I);
% 
% centers2, radi2,matrix2


%   str='circles.png';   %3.2 doubleline effect 4.1 donot know 4.2 can be handeled
%  %in coordinates we should make vertical line to check if that outer
%  %background and detect that
%  B = imread(str); 
%   
%  B=imresize(B,[600,600]);
%  B=im2bw(B);
%  B=~B;
% cc = bwconncomp(B)
% % cc.Size
% numPixels = cellfun(@numel,cc.PixelIdxList)
%   figure,imshow(B);
% se=strel('disk',60);
% B=imerode(B,se);
% cc = bwconncomp(B);
%  cc
%  figure,imshow(B);



  
  
  