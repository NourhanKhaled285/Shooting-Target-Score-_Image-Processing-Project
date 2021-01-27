function [centers , radi , matrix] = bright(Pic)
level = 0.6;
temp= im2bw(Pic,level);
disk = strel('disk', 4);
pic = imerode(temp,disk);
disk = strel('disk', 17);
pic = imclose(pic,disk);
figure ,imshow(pic),title('hough transform detected img');
[centers, radi,matrix] = imfindcircles(pic,[12 60],'ObjectPolarity','bright');%15 5000
viscircles(centers, radi,'EdgeColor','r');
end