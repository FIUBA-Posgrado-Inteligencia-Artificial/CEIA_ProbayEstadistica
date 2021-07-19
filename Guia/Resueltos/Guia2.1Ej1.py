import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

u = np.random.rand(1000)
x = (-np.log((1-u)))**2*60 # x = h(u)

#verifico:
t = np.linspace(0,2500,10000) # vector con elementos del 0 al 2500 espaciados en 0.25
F = 1 - np.exp(-np.sqrt(t/60))
sns.ecdfplot(x)
sns.lineplot(x=t,y=F)
plt.show()