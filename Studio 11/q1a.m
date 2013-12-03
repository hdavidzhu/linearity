resolution = 50;

x = linspace(-5,5,resolution);
y = linspace(-5,5,resolution);

[X,Y] = meshgrid(x,y);

u = -Y .* (X.^2 + Y.^2).^(.5);
v = X .* (X.^2 + Y.^2).^(.5);

quiver(X,Y,u,v)

% u = -y .* (x.^2 + y.^2).^(.5);
% v = x .* (x.^2 + y.^2).^(.5);