from pylab import *
from numpy import ma

# X,Y = meshgrid( arange(-5,5,1.0),arange(-5,5,1.0) )
X,Y = meshgrid( arange(-5,5,0.2),arange(-5,5,0.2) )
U = 100*(1+X**2+2*Y**2)**-2*2*X
V = 100*(1+X**2+2*Y**2)**-2*4*Y

#1
figure()
Q = quiver( U, V)
# qk = quiverkey(Q, 0.5, 0.92, 2, r'$2 \frac{m}{s}$', labelpos='W', fontproperties={'weight': 'bold'})
l,r,b,t = axis()
dx, dy = r-l, t-b
# axis([l-0.05*dx, r+0.05*dx, b-0.05*dy, t+0.05*dy])
axis([l-0.00005*dx, r+0.00005*dx, b-0.00005*dy, t+0.00005*dy])

# title('Minimal arguments, no kwargs')
show()