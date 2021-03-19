 str='6.3.jpg';   %3.2 doubleline effect 4.1 donot know 4.2 can be handeled
 %in coordinates we should make vertical line to check if that outer
 %background and detect that
 B = imread(str); 
 B=imresize(B,[1300,1300]);
 

 
% hf=floor(pts(2,2));
% wf=floor(pts(1,2));
% B = GetCoordinates(B);


 I=B;
 [h,w,s]=size(I);  
 I=imgaussfilt(I,0.8);
 I=imgaussfilt(I,0.8);
 col=I;
 gray=rgb2gray(I);
%  I= edge(gray,'canny',0.4);
 level=0.4;
 I=edge(gray,'Prewitt',0.04);
%  I= bwmorph(I, 'Skel', inf);
 I=im2bw(I,level);
 [H,theta,rho] = hough(I);
 P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
 x = theta(P(:,2));
y = rho(P(:,1));
%  kj=ceil(0.3*max(H(:)));
%  figure,imshow(kj);
lines = houghlines(I,theta,rho,P,'FillGap',100,'MinLength',7);

figure, imshow(B), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

 figure,imshow(I);
 
 
 