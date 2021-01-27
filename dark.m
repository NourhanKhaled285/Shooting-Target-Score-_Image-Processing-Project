function [centers , radi , matrix]=dark(Pic)
level = 0.1;
temp= im2bw(Pic,level);
disk = strel('disk', 17);
pic = imbothat(temp,disk);
figure ,imshow(pic),title('hough transform detected img bothat');
[centers, radi,matrix] = imfindcircles(~pic,[14 60],'ObjectPolarity','dark');%15 5000
viscircles(centers, radi,'EdgeColor','r');


pic = imclose(temp,disk);
figure ,imshow(pic),title('hough transform detected img close');
[centers2, radi2,matrix2] = imfindcircles(pic,[12 60],'ObjectPolarity','dark');%15 5000
viscircles(centers2, radi2,'EdgeColor','r')
centers=cat(1,centers,centers2);
radi=cat(1,radi,radi2);
matrix=cat(1,matrix,matrix2);
end