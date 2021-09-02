function [hn,wn]= get_coordinates(input)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   hn=0;
   wn=0;
  label=["1.1.jpg","1.2.jpg","2.1.png","2.2.png","3.1.png","3.2.png","3.3.jpg","4.1.jpg","4.2.jpg","4.3.jpg"];
  
  hn_idx=[661,657,645,636,633,651,621, 00 ,666,680];
  wn_idx=[662,662,671,650,638,648,650,  00, 655,621];
  ll=length(label) ;
  for w=1 :ll
     if strcmp(label(w),input)
         hn=hn_idx(w);
         wn=wn_idx(w);
     end
  end
 
end

