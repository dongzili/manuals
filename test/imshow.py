import matplotlib.pyplot as plt
import numpy as np

A = np.random.rand(5, 5)
A = np.arange(1,21).reshape(4,5)
print A
print len(A)
print len(A[0])
box = [2,4,3,4]
A[box[2]-1:box[3],box[0]-1:box[1]]=0
print A
plt.figure(1)
plt.imshow(A,cmap = 'gray', interpolation='nearest',aspect='equal')#,shape=[2,2],vmin = 0, vmax=5,extent=[0,2,0,2])
#plt.xlim(0.5, 1.5)
#plt.ylim(0.5,1.5)
plt.colorbar()
plt.show()
