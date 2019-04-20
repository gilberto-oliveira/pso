clc;
clear all;
close all;

# 2D, 5D and 10D
PSO_2Ds50   = csvread('PSO_2Ds50.csv');
PSO_5Ds150  = csvread('PSO_5Ds150.csv');
PSO_10Ds300 = csvread('PSO_10Ds300.csv');

# plot results
t = 1:length(PSO_2Ds50);

# use gnuplot toolkit
#graphics_toolkit('gnuplot');

figure(1);
plot(t, PSO_2Ds50(:, 2), '-k', 'linewidth', 2, ...
     t, PSO_5Ds150(:, 2), '-', 'linewidth', 2, ...
     t, PSO_10Ds300(:, 2), '-', 'linewidth', 2);
%hold on;
%plot(t, reER1p(:, 3), '-', 'linewidth', 2, ...
%     t, reERUn(:, 3), '-', 'linewidth', 2, ...
%     t, reET2p(:, 3), '-', 'linewidth', 2, ...
%     t, reETUn(:, 3), '-', 'linewidth', 2);
%hold on;
%plot(t, reE2R1p(:, 3), '-b', 'linewidth', 2, ...
%     t, reE2T1p(:, 3), '-', 'linewidth', 2, ...
%     t, reE3R2p(:, 3), '-', 'linewidth', 2, ...
%     t, reE3T2p(:, 3), '-', 'linewidth', 2);
%hold off;
grid minor;
legend('PSO\_2Ds50', ...
       'PSO\_5Ds150', ...
       'PSO\_10Ds300', ...
       'location', 'southeast');
title('Comportamento médio dos melhores fitness por geração - Experimentos 2D');
xlabel('Número de iterações');
ylabel('Fitness');
axis([1 500 .98 1]);

# show statistics resume
disptbl('PSO_2Ds50', PSO_2Ds50, 50);
disptbl('PSO_5Ds150', PSO_5Ds150, 50);
disptbl('PSO_10Ds300', PSO_10Ds300, 50);