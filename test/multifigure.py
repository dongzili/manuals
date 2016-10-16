#save figures into different pages of a pdf
import matplotlib.pyplot as plt
import matplotlib.backends.backend_pdf as pgs
import numpy as np
pdf = pgs.PdfPages("output.pdf")

A = np.arange(1,10).reshape(3,3)
plt.figure(1)
plt.imshow(A,cmap = 'gray', interpolation='nearest',extent=[0,2,0,2],aspect='equal',shape=[2,2])
plt.colorbar()
pdf.savefig(1)
plt.clf()

A = np.arange(11,20).reshape(3,3)
plt.figure(1)
plt.imshow(A,cmap = 'hot', interpolation='nearest',extent=[0,2,0,2],aspect='equal',shape=[3,3])
plt.colorbar()
pdf.savefig(1)


pdf.close()
