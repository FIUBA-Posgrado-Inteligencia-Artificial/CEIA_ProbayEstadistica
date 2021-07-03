pkg load statistics;

% moneda balanceada, exactamente 3 cecas de 10 tiradas
p = 0.5;
n = 10;
k= 3;
_3CecasDe10 = nchoosek(n,k) * p^k * (1-p)^(n-k)

% usando binopdf
_3CecasDe10_binopdf = binopdf(k,n,p)

% moneda cargada, al menos 3 de 10
p = 0.4;

p_sum = 0;

for k= 0:2
  kcecasDe10 = nchoosek(n,k) * p^k * (1-p)^(n-k);
  p_sum = p_sum + kcecasDe10;
end

alMenos3cecasDe10 = 1 - p_sum

% usando binocdf
alMenos3cecasDe10_binocdf = 1 - binocdf(2,n,p)

% proceso Bernoulli con v.a. uniforme

% configuro la semilla inicial del proceso aleatorio uniforme
rand ("seed", 123);

% moneda cargada
p = 0.4;

% numero de ensayos
N = 10000;

% numero de cecas, vale 1 cuando es ceca
ncecas_vector = zeros(N,1);

% hacemos N ensayos, en cada ensayo tiramos la moneda 10 veces
% y vemos si al menos 3 es ceca
for i = 1:N

  % n tiradas por ensayo
  for j = 1:n

    if(rand() < p)
      ncecas_vector(i) = ncecas_vector(i) + 1;
    end

  end

end

% calcular la media y varianza
media_muestral = sum(ncecas_vector) / N

% varianza muestral
varianza_muestral = (1/(N-1)) * sum((ncecas_vector - media_muestral * ones(N,1)).^2)

% media teorica
media_teorica = n*p

% varianza teorica
varianza_teorica = n * p * (1-p)