function y = filldisk(radius)
rsq = radius * radius;
R = round(radius);
c = R + 1;
t = 2*R + 1;
y = zeros(t);


y(:, c,1) =1;
y(c, :,1) =1;

y(:, c,2) =1;
y(c, :,2) =1;

y(:, c,3) =1;
y(c, :,3) =1;


for rstart = 1:R
    rend = round(sqrt(rsq - rstart * rstart));
    if rend < rstart
        break
    end
  
    % points of cross
    y(c+rstart, c+rstart,:) = 1;
    y(c+rstart, c-rstart,:) = 1;
    y(c-rstart, c+rstart,:) = 1;
    y(c-rstart, c-rstart,:) = 1;

  
 % fill 
    y(c+rstart:c+rend, c+rstart,:) = 1;
    y(c+rstart:c+rend, c-rstart,:) = 1;
    y(c-rend:c-rstart, c+rstart,:) = 1;
    y(c-rend:c-rstart, c-rstart,:) = 1;
    y(c+rstart, c+rstart:c+rend,:) = 1;
    y(c-rstart, c+rstart:c+rend,:) = 1;
    y(c+rstart, c-rend:c-rstart,:) = 1;
    y(c-rstart, c-rend:c-rstart,:) = 1;
    
end

end



