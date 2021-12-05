import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as stats

# genero 1000 realizaciones de 6 exponenciales de parámetro 5
x = np.random.exponential(scale=1/5, size=(1000,6))
y = np.min(x, axis=1) # calculo el mininmo de las 6 exp
sns.histplot(y, kde=True, stat='density') # grafico el hist y kde
# Y~exp(lambda*6). Superpongo la densidad verdadera y comparo
sns.lineplot(x=np.linspace(0,0.5,1000),y=stats.expon.pdf(np.linspace(0,0.5,1000), scale=1/(5*6)), color='C1') 
plt.show()
