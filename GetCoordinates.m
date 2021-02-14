function [B] = GetCoordinates(B)
 I=B;
 I=imgaussfilt(I,0.8);
 I=imgaussfilt(I,0.8);
 gray=rgb2gray(I);
 y = graythresh(gray);
 level=0.46;
 I=edge(gray,'Prewitt',0.04);
 I=im2bw(I,level);
 [y,x,s]=size(I);
 xn=floor(x/2);
 yn=floor(y/2);
col_tem=I(1,xn);
cory=0;
for cory=1:y
    if col_tem~=I(cory,xn)%&&I(cory,xn)~=I(cory,xn+10)
    
        break;
    else
       col_tem=I(cory,xn); 
    end
    
    
end

  pxtop=xn;
  pytop=cory;
  ptop=zeros(1,2);
  ptop(1,1)=pxtop;
  ptop(1,2)=pytop;
  
  
  
  
    col_tem=I(y,xn);
  cy=y;
while cy>=1 
    if col_tem==I(pytop,pxtop)
      
        break;
    else
       col_tem=I(cy,xn); 
    end
    
    cy=cy-1;
end
pxbottom=xn;
pybottom=cy;

  pbottom=zeros(1,2);
  pbottom(1,1)=pxbottom;
  pbottom(1,2)=pybottom;
  

  
  
  
      col_tem=I(1,yn);
    for corx=1:x
     if col_tem~=I(yn,corx)%&&I(yn,corx)~=I(yn+10,corx)
    
        break;
    else
       col_tem=I(yn,corx); 
    end

    end
    pxleft=corx;
    pyleft=yn;
    pleft=zeros(1,2);
  pleft(1,1)=pxleft;
  pleft(1,2)=pyleft;

  
  
  
   col_tem=I(x,yn);
   corx=x;
   
     while corx>=1 
          if (col_tem==I(pyleft,pxleft))%&&I(yn,corx)~=I(yn+10,corx))
    
        break;
    else
       col_tem=I(yn,corx); 
          end
     corx=corx-1;
    end
    pxright=corx;
    pyright=yn;
    pright=zeros(1,2);
  pright(1,1)=pxright;
  pright(1,2)=pyright;
%   dd=abs(pxleft-pxright);
%   ddmax=floor(dd/2);
%   ddmin=floor(dd/4);
%    [centers, radi]=imfindcircles(I,[ddmin ddmax],'ObjectPolarity','dark');
%    viscircles(centers, radi,'EdgeColor','r');
  distrig=abs(floor(xn-pxright))
  distleft=abs(floor(xn-pxleft))
 
  diff=distleft;
  newxcenter=xn;
  cc=1;
  while (cc>0)
  if distrig>diff
       newxcenter=newxcenter+1;
     diff=abs(floor(newxcenter-pxleft));
  else
      cc=-1;
      diff;
  end
  end
  
 cc=1;
  diff=distrig;
  newxcenter=xn;
  while (cc>0)
  if distleft>diff
       newxcenter=newxcenter-1;
     diff=abs(floor(newxcenter-pxright));
  else
     cc=-1;
  end
  end
 
  distop=floor(abs(yn-pytop))
  disbottom=floor(abs(yn-pybottom))
  diff2=distop;
  newycenter=yn;
  cc=1;
  while (cc>0)
  if disbottom>diff2
       newycenter=newycenter+1;
     diff2=abs(floor(newycenter-pytop));
  else
      cc=-1;
  end
  end
  
  diff2=disbottom;
  newycenter=yn;
  cc=1;
  while (cc>0)
  if distop>diff2
       newycenter=newycenter-1;
     diff2=abs(floor(newycenter-pybottom));
  else
      cc=-1;
      diff2;
  end
  end
  
 
 
%     color={'blue'};   
%     pos=[newxcenter,newycenter];
%   B = insertMarker(B,pos,'x','color',color,'size',10);
  
  color={'red'};
  B = insertMarker(B,ptop,'x','color',color,'size',10);
  
   color={'red'};
  B = insertMarker(B,pbottom,'x','color',color,'size',10);

    color={'red'};
  B = insertMarker(B,pleft,'x','color',color,'size',10);

  B = insertMarker(B,pright,'x','color',color,'size',10);

end



%   
% %   
% %   distop=abs(yn-pytop)
% %   disbottom=abs(yn-pybottom)
% %    dif1=abs(distop-disbottom);
% %    dif1=abs(pytop-pybottom);
% %   if distop>disbottom
% %      yn=yn-dif1;
% %   elseif  distop<disbottom
% %      yn=yn+dif1;
% %      
% %   end
% %   
% %   
% %   distrig=abs(xn-pxright)
% %   distleft=abs(xn-pxleft)
% %   dif2=abs(distrig-distleft);
% %     dif2=abs(pxleft-pxright);
% %     if distrig>distleft
% %      xn=xn+dif2;
% %   elseif  distrig<distleft
% %      xn=xn-dif2;
% %      
% %   end
% %   distrig=abs(floor(xn-pxright))
% %   distleft=abs(floor(xn-pxleft))
% %   newxcenter=0;
% %   if distrig>distleft
% %     sh=abs(floor(pxright-xn));
% %     addif=distleft+floor(sh/2);
% %     newxcenter=pxleft+addif;
% %  elseif distleft> distrig
% %    sh=abs(floor(xn-pxleft));
% %    addif=distrig+floor(sh/2);
% %    newxcenter=pxright-addif;
% %    
% %   end
% % 
% %     color={'blue'};   
% %     pos=[xn,yn];
% %   B = insertMarker(B,pos,'x','color',color,'size',10);
% %     
% %     color={'blue'};   
% %     pos=[newxcenter,yn];
% %   B = insertMarker(B,pos,'x','color',color,'size',10);
% %   newxcenter=floor((pxright-pxleft)/2)
% %   distrig=abs(floor(newxcenter-pxright))
% %   distleft=abs(floor(newxcenter-pxleft))
% %   if distrig>distleft
% %       dif=floor(distrig/2);
% %       newxcenter=pxleft+(distleft+dif);
% %   elseif distleft>distrig
% %       dif=distleft-distrig;
% %       newxcenter=newxcenter-dif;
% %   end


