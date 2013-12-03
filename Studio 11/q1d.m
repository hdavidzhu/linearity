clear all;

resolution = 100;

syms x y z

u = -x * (x^2 + y^2)^(-1);
v = y * (x^2 + y^2)^(-1);
w = 0;

% Algebraically calculates the divergence and the curl.
s_div = simplify(divergence([u,v],[x,y]))
s_curl = simplify(curl([u,v,w],[x,y,z]))

d_div = matlabFunction(s_div);
d_curl = matlabFunction(s_curl(3));

% Start graphing and change algebra into discrete function handler.
x = linspace(0,1,resolution);
y = linspace(0,1,resolution);

[X,Y] = meshgrid(x,y);

u = -X .* (X.^2 + Y.^2).^(-1);
v = Y .* (X.^2 + Y.^2).^(-1);

figure
quiver(X,Y,u,v)
title('Question 1d. Velocity Field.');
xlabel('X');
ylabel('Y');
axis([0 1 0 1]);

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
title('Question 1d. Divergence contours.');
xlabel('X');
ylabel('Y');
axis([0 1 0 1]);

figure
contour(X,Y,D_curl)
title('Question 1d. Curl contours.');
xlabel('X');
ylabel('Y');
axis([0 1 0 1]);
