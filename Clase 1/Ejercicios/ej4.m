% cargar el paquete de estadistica
pkg load statistics;

mu = 0;
sigma = 1;

% Probabilidad X>0.7
pX_mayor_0_7 = 1 - mvncdf(0.7,mu,sigma)

% Probabilidad Y<0.4
pY_menor_0_4 = mvncdf(0.4,mu,sigma)

% las probabilidades se muitiplican (variables independentes)
pX_mayor_0_7_pY_menor_0_4 = pX_mayor_0_7 * pY_menor_0_4

% graficar las pdf conjuntas

% basado en un ejemplo de MathWorks.com
% https://www.mathworks.com/help/stats/multivariate-normal-distribution.html

% vector de medias
mu = [0 0];

% matrix de covarianza
sigma = [1 0; 0 1];

x1 = -3:0.2:3;
x2 = -3:0.2:3;
[X1,X2] = meshgrid(x1,x2);
X = [X1(:) X2(:)];

% pdf conjunta
y = mvnpdf(X,mu,sigma);
y = reshape(y,length(x2),length(x1));

h = surf(x1,x2,y);
caxis([min(y(:))-0.5*range(y(:)),max(y(:))])
xlabel('x1')
ylabel('x2')
zlabel('Probability Density')

waitfor(h,"timeout", 5)

% cdf de x e y
p = mvncdf(X,mu,sigma);

Z = reshape(p,length(x1),length(x2));

figure
h = surf(X1,X2,Z);

waitfor(h,"timeout", 10)