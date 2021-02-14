function pts = Getcenter(image, n)
n=n;
if nargin < 2
   
    pts = zeros(2, 0);
else
    pts = zeros(2, n);
end
imshow(image);     % display image
xold = 0;
yold = 0;
k = 0;
c=0;
hold on;           % and keep it there while we plot
while c<n          %stopping condition
    [xi, yi] = ginput(1);      % get a point
 
  
    k = k + 1;
    pts(1,k) = xi;
    pts(2,k) = yi;
      if xold
          plot([xold xi], [yold yi], 'go-');  % draw as we go
      else
          plot(xi, yi, 'go');                 % first point on its own
      end
      if isequal(k, n)
          break
      end
      xold = xi;
      yold = yi;
      c=c+1;
  end
hold off;
if k < size(pts,2)
    pts = pts(:, 1:k);
end
pts
end
% peppers = imread('peppers.png'); % this pis is in MATLAB
% figure(1);
% imagesc(peppers);
% [rows, cols,~] = size(peppers);
% cirCtr = [100,200]; % center of the circle in pixels
% cirDia = 100; % circle diameter in pixels
% x = ((1:cols) - cirCtr(2));
% y = ((1:rows) - cirCtr(1));
% [Xdata,Ydata] = meshgrid(x,y); % rows x cols
% [Theta,R] = cart2pol(Xdata,Ydata); % rows x cols
% hold on;
% mask = R;
% mask(mask <= cirDia / 2) = nan; % nan the center
% mask(mask > cirDia / 2) = 0; % black out the outside
% imagesc(mask,'alphaData',isfinite(mask)); % magic happens here
% axis equal tight;
% colormap gray;