function [centers , radi , matrix]=dark(Pic)

histogram(Pic);  
binaryImage=im2bw(Pic);
totalPixels = numel(binaryImage);
numWhitePixels = sum(binaryImage(:));
numBlackPixels = totalPixels - numWhitePixels;

binaryImage1=im2bw(Pic,0.1);
totalPixels1 = numel(binaryImage1);
numWhitePixels1 = sum(binaryImage1(:));
numBlackPixels1 = totalPixels1 - numWhitePixels1;

disp(numBlackPixels);
disp(numBlackPixels1);

if round(numBlackPixels1/numBlackPixels)==1 || numBlackPixels1/numBlackPixels<0.05
level = 0.1;
disk = strel('disk',10 );
disk2 = strel('disk',0 );
else
level = 0.3;
disk = strel('disk',12 );
disk2 = strel('disk',3 );
end
temp= im2bw(Pic,level);
figure ,imshow(temp),title(' BW ');


pic = imerode(~temp,disk2);
figure ,imshow(pic),title('hough transform detected img erode');
pic1 = imdilate(pic,disk);
figure ,imshow(pic1),title('hough transform detected img dilate');

[centers, radi,matrix] = imfindcircles(pic1,[15 30],'ObjectPolarity','bright');%15 5000
viscircles(centers, radi,'EdgeColor','r')

end






% function [centers , radi , matrix]=dark(Pic)
% histogram(Pic);  
% binaryImage=im2bw(Pic);
% totalPixels = numel(binaryImage);
% numWhitePixels = sum(binaryImage(:));
% numBlackPixels = totalPixels - numWhitePixels;
%  disp(numWhitePixels);
%  disp(numBlackPixels);
% 
% level = 0.1;
% temp= im2bw(Pic,level);
% disk = strel('disk', 10);
% % pic = imbothat(temp,disk);
% % figure ,imshow(pic),title('hough transform detected img bothat');
% % disk = strel('disk' ,10);
% % pic2 = imdilate(pic,disk);
% % figure ,imshow(pic2),title('hough transform detected img dilate');
% % [centers, radi,matrix] = imfindcircles(~pic2,[12 60],'ObjectPolarity','dark');%15 5000
% % viscircles(centers, radi,'EdgeColor','r');
% 
% pic = imclose(~temp,disk);
% figure ,imshow(pic),title('hough transform detected img close');
% pic2 = imdilate(pic,disk);
% figure ,imshow(pic2),title('hough transform detected img dilate');
% [centers, radi,matrix] = imfindcircles(pic2,[14 50],'ObjectPolarity','bright');%15 5000
% viscircles(centers, radi,'EdgeColor','r')
% % centers=cat(1,centers,centers2);
% % radi=cat(1,radi,radi2);
% % matrix=cat(1,matrix,matrix2);
% end