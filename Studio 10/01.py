import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

matplotlib.rcParams['xtick.direction'] = 'out'
matplotlib.rcParams['ytick.direction'] = 'out'

delta = 0.005
x = np.arange(-3.0, 3.0, delta)
y = np.arange(-3.0, 3.0, delta)

X, Y = np.meshgrid(x, y)
T = 100 / (1 + X**2 + 2*Y**2)

plt.figure()
levels = np.arange(0.75, 3.25, 0.3)
CS = plt.contour(X, Y, T)
plt.clabel(CS, inline=1, fontsize=10)
plt.title('Question 1. Contour Lines of T(x,y).')

plt.show()