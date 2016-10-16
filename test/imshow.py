import matplotlib.pyplot as plt
import numpy as np

A = np.random.rand(5, 5)
A = np.arange(1,10).reshape(3,3)
plt.figure(1)
plt.imshow(A,cmap = 'gray', interpolation='nearest',extent=[0,2,0,2],aspect='equal',shape=[2,2])
#plt.xlim(0.5, 1.5)
#plt.ylim(0.5,1.5)
plt.show()
