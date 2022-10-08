clear all 
x=[0,2,4,6];
y=[5.32236,4.20714,3.81264,3.0548];
xn=linspace(0,20);
yn=5.32236.*exp((-log(2)).*xn./7.558);
R = -corrcoef(xn,yn);
h=text(3,5,'y=5.32236*exp(-0.0917x)');
g=text(3,4.8,'R^2=0.9974');
hold on 
set(h);
xlabel('t/hour');
ylabel('FI');
scatter(x,y,'b')
plot(xn,yn,'k')
legend('real','fitting');
 

