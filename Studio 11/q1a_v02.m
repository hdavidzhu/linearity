clear all;

resolution = 50;

syms x y z

u = -y * (x^2 + y^2)^(-.5);
v = x * (x^2 + y^2)^(-.5);
w = 0;

% Algebraically calculates the divergence and the curl.
s_div = simplify(divergence([u,v],[x,y]));
s_curl = simplify(curl([u,v,w],[x,y,z]));

d_div = matlabFunction(s_div);
d_curl = matlabFunction(s_curl(3));

% Start graphing and change algebra into discrete function handler.
x = linspace(-5,5,resolution);
y = linspace(-5,5,resolution);

[X,Y] = meshgrid(x,y);

u = -Y .* (X.^2 + Y.^2).^(-.5);
v = X .* (X.^2 + Y.^2).^(-.5);

figure
quiver(X,Y,u,v)
title('Question 1a. Velocity Field.');
xlabel('X');
ylabel('Y');
axis([-5 5 -5 5]);

if nargin(d_div) == 0
	D_div = repmat(d_div(),resolution);
else
	for i = 1:resolution
		for j = 1:resolution
			D_div(i,j) = d_div(x(i),y(j));
		end
	end
end

if nargin(d_curl) == 0
	D_curl = repmat(d_curl(),resolution);
else
	for i = 1:resolution
		for j = 1:resolution
			D_curl(i,j) = d_curl(x(i),y(j));
		end
	end
end

figure
contour(X,Y,D_div)
title('Question 1a. Divergence contours.');
xlabel('X');
ylabel('Y');
axis([-5 5 -5 5]);

figure
contour(X,Y,D_curl)
title('Question 1a. Curl contours.');
xlabel('X');
ylabel('Y');
axis([-5 5 -5 5]);
