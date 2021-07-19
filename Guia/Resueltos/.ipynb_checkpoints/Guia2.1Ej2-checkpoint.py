import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as stats

## Ejercicio 2.1.2
# simulo 1000 tiradas de un dadp
xy = np.random.randint(1,7,size=(1000,2))  
# sumo los resultados de cada dado para generar 1000 observaciones de z
z = np.sum(xy,axis=1)

# grafico la función de proba estimada
plt.bar(np.arange(1, np.max(z)+1), np.bincount(z)[1:]) 
# bincount me cuenta cuantos caen desde 0 hasta el max valor obs del vector. Aca 0 no es un valor posible, asi que lo quito
plt.show()