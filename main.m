% This code is created by Hao Yan? June 8th, 2017
% If you have any questions, please contact HaoYan@asu.edu
% Paper: Yan, Hao, Kamran Paynabar, and Jianjun Shi. "Anomaly detection in images with smooth background via smooth-sparse decomposition." Technometrics 59.1 (2017): 102-114.
load data.mat

sigma = 0.05;
delta = 0.2;
Y = Y0 + delta*A0 + normrnd(0,sigma,size(A0,1),size(A0,2));
figure;imagesc(Y)


kx = 6; ky = 6;
nx = size(Y,1); ny = size(Y,2);
B{1} = bsplineBasis(nx,kx,3);
B{2} = bsplineBasis(ny,ky,3);
sd = 3;
snk = 4;  skx = round(nx/snk); sky = round(ny/snk);
Bs{1} = bsplineBasis(nx,skx,2);
Bs{2} = bsplineBasis(ny,sky,2);


 [yhat,a] = bsplineSmoothDecompauto(Y,B,Bs,[],[]);
 
 figure
 colormap('jet')
 subplot(1,2,1)
 imagesc(yhat)
 title('Mean')
 set(gca,'FontSize',14)

 subplot(1,2,2)
 imagesc(a)
 title('Anomalies')
 set(gca,'FontSize',14)
 
  
 