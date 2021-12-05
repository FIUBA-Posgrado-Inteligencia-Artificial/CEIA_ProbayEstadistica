pkg load statistics;

N = 100;

x1 = linspace(0,1,N);
x2 = linspace(0,1,N);

% joint pdf
y = zeros(N,N);

for i = 1:length(x1)
  for j = 1:length(x2)
    y(i,j) = 1;
  end
end

% plot the joint pdf, Fxy =1
h = surf(x1,x2,y)
xlabel('x1')
ylabel('x2')
zlabel('Probability Density')

waitfor(h,"timeout",5)


% joint cdf, Fxy = xy
Y= zeros(N,N);

for i = 1:length(x1)
  for j = 1:length(x2)
    Y(i,j) = x1(i)*x2(j);
  end
end

figure
% plot the joint pdf
h = surf(x1,x2,Y)
xlabel('x1')
ylabel('x2')
zlabel('Cumulative Probability')
waitfor(h,"timeout",10)