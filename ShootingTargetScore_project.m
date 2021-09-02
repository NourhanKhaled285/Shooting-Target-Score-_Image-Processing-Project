 str='2.1.png';   %3.2 doubleline effect 4.1 donot know 4.2 can be handeled
 %in coordinates we should make vertical line to check if that outer
 %background and detect that
 B = imread(str);  
 B=imresize(B,[1300,1300]);

% pts = Getcenter(B,1);
% hn=floor(pts(2,1));
% wn=floor(pts(1,1));


figure,imshow(B);

 %figure('Renderer', 'painters', 'Position', [250 5 900 1000]),subplot(2,2,1), imshow(B),title('original size');


 [hn,wn]=get_coordinates(str);


level = 0.8;
temp= im2bw(B,level);
[centers] = imfindcircles(temp,[15 60],'ObjectPolarity','bright');
[A] = size(centers) ;
disp(A);
if(A==0)
  [centers , radi , matrix] = dark(B);
else
 [centers , radi , matrix] = bright(B);
end
[A] = size(centers);
disp(A);
centers


 I=B;
 [h,w,s]=size(I);
 if strcmp(str,'3.2.png')
     for i=wn:w

 for po=0:10

  
        I(hn-po,i,:)=I(hn-po,i,:)*0+I(hn-20+po,i,:);%-3po
        I(hn+po,i,:)=I(hn+po,i,:)*0+I(hn-20+po,i,:);
 end
 end
  
%  I=imgaussfilt(I,0.8);
%  I=imgaussfilt(I,0.8);
 col=I;
 gray=rgb2gray(I);
%  I= edge(gray,'canny');
 y = graythresh(gray);
 level=0.6;
 I=edge(gray,'Prewitt',0.04);
%  I= bwmorph(I, 'Skel', inf);
 I=im2bw(I,level);
%   se=strel('line',15,20);
%  I=impothat(I,se);
 se=strel('disk',6);
 I=imclose(I,se);
 
 
  se=strel('disk',4);
 I=imopen(I,se);
%  imshow(I);

 else
     
  prec=(30/650);
  vv=floor(prec*hn);
  for i=wn:w

 for po=0:10
  
        I(hn-po,i,:)=I(hn-po,i,:)*0+I(hn-vv+4*po,i,:);%-3po
        I(hn+po,i,:)=I(hn+po,i,:)*0+I(hn-vv+4*po,i,:);
 end


  end
  
%    figure('Renderer', 'painters', 'Position', [250 5 1400 1000]);
%  subplot(2,2,1),image(I),title('horizontal noise deleted');
 
%  I=imgaussfilt(I,0.8);
%  I=imgaussfilt(I,0.8);
 col=I;
 gray=rgb2gray(I);
%  I= edge(gray,'canny');
 y = graythresh(gray);
 level=0.46;
 I=edge(gray,'Prewitt',0.04);
%  I= bwmorph(I, 'Skel', inf);
 I=im2bw(I,level);
%  se=strel('line',w,0);
%  I=imerode(I,se);

 end


%  subplot(2,2,3),imshow(I),title('BW to calc ranges');
 L= length(centers);
CenterColor = I(hn,wn); 
cou=0;
check=0;
cou_matrix=[];
cou_idx=1;
res=0;
col(hn,wn,1)=0;
col(hn,wn,2)=0;
col(hn,wn,3)=255;
c_sh=1;
shift=zeros(wn,2);
 minth=0;
 min=100000;
 noises_detected=[];
 no_det_idx=1;
 get=[];
 for i=wn:w
     
     if(cou_idx==1&&~(CenterColor ==I(hn,i)))

                noises_detected(no_det_idx)=i-1;
                no_det_idx=no_det_idx+1;
                col(hn,i-1,1)=0;
                col(hn,i-1,2)=0;
                col(hn,i-1,3)=255;
                
              
             cou_matrix(cou_idx)=cou;
             cou_idx=cou_idx+1;
             CenterColor = I(hn,i); % saved color
       
        cou=0; 
      check=0;
       
     else
         cou=cou+1;
         check=0;
     end

    
    if cou_idx>1&&CenterColor ~=I(hn,i)

            if(cou>=cou_matrix(1)/1.5)
                
               get(1)=cou_matrix(cou_idx-1);
               get(2)=cou;
                col(hn,i-1,1)=0;
                col(hn,i-1,2)=0;
                col(hn,i-1,3)=255;
                
                
                noises_detected(no_det_idx)=i-1;
                no_det_idx=no_det_idx+1;
                
                
                sav_pos=i;
             cou_matrix(cou_idx)=cou;
             cou_idx=cou_idx+1;
           
             CenterColor = I(hn,i); % saved color
           
             cou=0;
            else
             
              CenterColor = I(hn,i); 
              cou=cou+1;
%                 cou=0;
              check=0;
            end
    
          else
          
        cou=cou+1;
        check=0;
        end
 end
 get(2)
 get(1)
if(get(2)>1.5*get(1))
    col(hn,noises_detected(no_det_idx-1),1)=255;
    col(hn,noises_detected(no_det_idx-1),2)=255;
    col(hn,noises_detected(no_det_idx-1),3)=0;
end
   color = {'yellow'};
   col = insertMarker(col,shift,'x','color',color,'size',10); 
ranges=0;
rad_det=[];
rad_cou=0;
rad_idx=1;
poos=[];
pp=1;
poos2=[];
pp2=1;
co=0;
bx=1;
ind_ran=[]

for v=wn:w
    if(col(hn,v,1)==0&&col(hn,v,2)==0&&col(hn,v,3)==255)
        ind_ran(bx)=v;
        bx=bx+1;
        ranges=ranges+1;
        poos(pp)=v;
        pp=pp+1;
      rad_det(rad_idx)=rad_cou;
      rad_idx=rad_idx+1;
    elseif(col(hn,v,1)==255&&col(hn,v,2)==0&&col(hn,v,3)==0)
          poos2(pp2)=v;
          pp2=pp2+1;

    else
        rad_cou=rad_cou+1;
        
    end
    
end

ranges=ranges-1

ind_ran


rad_det
% hn
% wn
% figure,imshow(col);

%%%%%%%%%%%%%%%%%calculate the score%%%%%%%%%%%%%%%%%
[distances,Bullseye_hit,score,score_array_each_range] = CalculateTheScore(rad_det,centers,wn,hn);

distances
Bullseye_hit
score
score_array_each_range


pos=zeros(rad_idx-1,2);
pos2=zeros(pp2-1,2);
for i=1:rad_idx-1
    for j=1:2
        if j==2
            pos(i,j)=hn;
        else
          pos(i,j)=poos(i);  
        end
    
    end
end


for i=1:pp2-1
    for j=1:2
        if j==2
            pos2(i,j)=hn;
        else
          pos2(i,j)=poos2(i);  
        end
    
    end
end
 
  color = {'blue'};
 col = insertMarker(col,pos,'x','color',color,'size',10);
 
 color = {'red'};
 col = insertMarker(col,pos2,'x','color',color,'size',10);

%  col = insertMarker(col, ShootsCenters,'x','color',color ,'size',10);
%  subplot(1,2,2),image(col),title('detected ranges');
 
figure ,imshow(I),title('BW to calc ranges');

 figure,imshow(col),title('detected ranges');
 

    
  