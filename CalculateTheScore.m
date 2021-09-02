function [distances,Bullseye_hit_temp,score,scor_ar] = CalculateTheScore(rad_det,centers,wn,hn)
%%%%%%%%%%%%%%%%%calculate the score%%%%%%%%%%%%%%%%%
scor_ar=[];
ranges=length(rad_det)-1;
L=length(centers);

Bullseye_hit= ranges *100;
Bullseye_hit_temp=Bullseye_hit;
distances=[];
score = 0 ;
in=1;
for i=1:L 
    
      px=centers(i,1);
      py=centers(i,2);
      d1=((px-(wn)).^2 );
      d2=((py-(hn)).^2);
      distances(i)=sqrt(d1+d2)-7;
end
distances = sort(distances);

for i=2: ranges+1
      
    for j=1 :L
    
        if (distances(j)<= rad_det(i)&&distances(j)>rad_det(i-1))
            
            score=score+Bullseye_hit;
            scor_ar(in)=Bullseye_hit;
            in=in+1;
         
        end 
       
        
    end
   
    Bullseye_hit=Bullseye_hit-50;
end
end

