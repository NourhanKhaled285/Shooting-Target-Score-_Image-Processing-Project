str='1.2c.jpg';
B = imread(str); 
 B=imresize(B,[1300,1300]);
[y,x,s]=size(B);
figure ,imshow(B),title('original size');
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%% preprocessing & hough transform detected %%%%%%%%%%%%%%%%%%%%%%%%%%%%  
rec=[7,100,1286-7,1202-100];
imc=imcrop(B,rec); 
B=imc;
figure ,imshow(B),title('resized & croped img');
level = 0.06;
temp= im2bw(B,level);
[centers] = imfindcircles(temp,[12 60],'ObjectPolarity','dark');
[A] = size(centers) ;
if(A==0)
 [centers , radi , matrix] = bright(B);
else
 [centers , radi , matrix] = dark(B);
end
[A] = size(centers);
disp(A);

% %%%%%%%%%%%%%%%%%%%%%%%%range code %%%%%%%%%%%%%%%%%%
I=B;
[h,w,s]=size(I);
hn=floor(h/2);
wn=floor(w/2);
for i=wn:w
   
 for po=0:10
        I(hn-po,i,:)=I(hn-po,i,:)*0+I(hn+40-3*po,i,:); %-3po %7
        I(hn+po,i,:)=I(hn+po,i,:)*0+I(hn+40-3*po,i,:);
 end

end
    figure,imshow(I),title('deleted');
% BW2 = bwperim(I,8);
 level = 0.6;
 col=I;
gray=rgb2gray(I);
ti=gray>200;
figure ,imshow(ti),title('gray > 200');
BW = locallapfilt(I,0.95,0.5);
BW = locallapfilt(BW,0.7,0.5);
BW=imgaussfilt(BW,0.8);
 I=im2bw(BW,level);

% figure ,imshow(BW),title('close1');
figure ,imshow(I),title('close org');
%%%%%%%%%%%%%%%%%
L= length(centers);
CenterColor = I(hn,wn); 
cou=0;
check=0;
cou_matrix=[]
cou_idx=1;
res=0;
sav_pos=0;
jump=0;
for i=wn:w
     col(hn,wn,1)=0;
     col(hn,wn,2)=0;
     col(hn,wn,3)=255;

     if(cou_idx==1&&~(CenterColor ==I(hn,i))&&I(hn,i)==I(hn+20,i))
          %cou
           jump=jump+1;
           % if(check==0)
                col(hn,i-1,1)=0;
                col(hn,i-1,2)=0;
                col(hn,i-1,3)=255;
                sav_pos=i;
              
             cou_matrix(cou_idx)=cou;
             cou_idx=cou_idx+1;
          
             CenterColor = I(hn,i); % saved color
       
        cou=0; 
      check=0;
%                end
     end
    if CenterColor ~=I(hn,i)&&I(hn,i)==I(hn+20,i)
        

               %cou
            if(cou_idx>1&&cou>=cou_matrix(1)/2)

%              if(check==0)
              col(hn,i-1,1)=0;
                col(hn,i-1,2)=0;
                col(hn,i-1,3)=255;
                sav_pos=i;
             cou_matrix(cou_idx)=cou;
             cou_idx=cou_idx+1;
           
             CenterColor = I(hn,i); % saved color
           
             cou=0;
            else
             
              CenterColor = I(hn,i); 
              cou=0;
              check=0;
             end
%               else
%              
%               CenterColor = I(hn,i); 
%               cou=0;
%               check=0;
%             end
           
      else
        cou=cou+1;
        check=0;
        end
end
% figure,imshow(col),title('colored***************');


% cou_matrix


ranges=0;
rad_det=[];
rad_cou=0;
rad_idx=1;
poos=[];
pp=1;
poos2=[];
pp2=1;
for v=wn:w
    if(col(hn,v,1)==0&&col(hn,v,2)==0&&col(hn,v,3)==255)
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

% if ~(strcmp(str,'1.1c.jpeg')||strcmp(str,'3.2c.png'))
% ranges=ranges-1;
% end
% rad_det


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

 color = {'red'};
 col = insertMarker(col,centers,'x','color',color,'size',10);
 figure,imshow(col),title('det');

%%%%%%%%%%%%%%%%%calculate the score%%%%%%%%%%%%%%%%%
ranges=ranges-1;
rad_det
Bullseye_hit= ranges *100;
Bullseye_hit
distances=[];
score = 0 ;
for i=1:L 
    
      px=centers(i,1);
      py=centers(i,2);
      d1=((px-(wn)).^2 );
      d2=((py-(hn)).^2);
      distances(i)=sqrt(d1+d2);
end
distances

for i=2: ranges
    for j=1 :L
     
        if distances(j)<= rad_det(i)&&distances(j)>rad_det(i-1)
            score=score+Bullseye_hit;
         
        end 
        
    end
    Bullseye_hit=Bullseye_hit-50;
end
score



% 
% % % % % % % % % % % % % % % coordinates of the board% % % % % % % % % % % % % %
% % 
% % figure ,imshow(fg);
% % xn=floor(x/2);
% % yn=floor(y/2);
% % col_tem=B(1,xn);
% % cory=0;
% % for cory=1:y
% %     if~(col_tem==B(cory,xn))
% %     
% %         break;
% %     else
% %        col_tem=B(cory,xn); 
% %     end
% %     
% %     
% % end
% % 
% %   pxtop=xn;
% %   pytop=cory;
% %     ptop=zeros(1,2);
% %   ptop(1,1)=pxtop;
% %   ptop(1,2)=pytop;
% %   
% %   
% %   
% %       col_tem=B(1,yn);
% %     for corx=1:x
% %           if~(col_tem==B(yn,corx))
% %     
% %         break;
% %     else
% %        col_tem=B(yn,corx); 
% %     end
% % 
% %     end
% %     pxleft=corx;
% %     pyleft=yn;
% %     pleft=zeros(1,2);
% %   pleft(1,1)=pxleft;
% %   pleft(1,2)=pyleft;
% % 
% %   
% %   
% %   
% %    col_tem=B(x,yn);
% %    corx=x;
% %    
% %      while corx>=1 
% %           if (col_tem==B(pyleft,pxleft))
% %     
% %         break;
% %     else
% %        col_tem=B(yn,corx); 
% %           end
% %      corx=corx-1;
% %     end
% %     pxright=corx;
% %     pyright=yn;
% %     pright=zeros(1,2);
% %   pright(1,1)=pxright;
% %   pright(1,2)=pyright;
% %     
% % 
% %   color={'red'};
% %   B = insertMarker(B,ptop,'x','color',color,'size',10);
% %   
% %     color={'red'};
% %   B = insertMarker(B,pleft,'x','color',color,'size',10);
% % 
% %   B = insertMarker(B,pright,'x','color',color,'size',10);
% %   figure ,imshow(B);
% %   
% %     d1=((pxtop-(xn)).^2 );
% %     d2=((pytop-(yn)).^2);
% %     rad=sqrt(d1+d2);
% %     im=filldisk(rad);
% %     im=imresize(im,[1300,1300]);
% %     for oo=1:1300
% %         for kk=1:1300
% %            im(oo,kk,1)= im(oo,kk,1)*B(oo,kk,1);
% %            im(oo,kk,2)= im(oo,kk,2)*B(oo,kk,2);
% %            im(oo,kk,3)= im(oo,kk,3)*B(oo,kk,3);
% %         end
% %     end
% %     figure,imshow(im);
% %     
% %   
% 
% 
% % 



%  rec=[7,100,1286-7,1202-100];
%  imc=imcrop(B,rec); 
%  B=imc;
% figure ,imshow(B),title('resized & croped img');
% % gray=rgb2gray(B);
% % temp=gray>100;
%    level = 0.1;
% %  level = 0.6;
%  temp= im2bw(B,level);
% %  se = strel('disk',6);
% %  temp = imopen(temp,se);
% %  se = strel('disk',4);
% %  temp = imerode(temp,se);
% %  se = strel('disk', 17);
% %  temp = imclose(temp,se);
% 
%  figure ,imshow(temp),title('hough transform detected img');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%% hough transform detected %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [centers, radi,matrix] = imfindcircles(temp,[16 35],'ObjectPolarity','bright');%16 35
% viscircles(centers, radi,'EdgeColor','b');



% [centers, radi,matrix] = imfindcircles(temp,[16 35],'ObjectPolarity','dark');%15 5000
% viscircles(centers, radi,'EdgeColor','r');

% 
% [centers, radi,matrix] = imfindcircles(temp,[12 60],'ObjectPolarity','dark');%15 5000
% viscircles(centers, radi,'EdgeColor','r');


% [centers, radi,matrix] = imfindcircles(temp,[12 80],'ObjectPolarity','bright');%15 5000
% viscircles(centers, radi,'EdgeColor','b');
 
% [centers, radi,matrix] = imfindcircles(temp,[12 60],'ObjectPolarity','bright');%15 5000
% viscircles(centers, radi,'EdgeColor','b');

