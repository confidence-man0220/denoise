
%%a noisefree   b: noisefree-noisy or noisefree-denoised

figure('color','w')
box on;
hold on;
d=c_hosvd;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scatter (a, a-d,20,'MarkerFaceColor', 'k','MarkerEdgeColor', 'k','Marker','.');

axis([0 1 -0.30001 0.30001]);set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1]);
set(gca,'ytick',[-0.3 -0.2 -0.1 0 0.1 0.2 0.3])
mu=mean(a-d);sd=std(a-d);
line([0 1], [mu mu], 'LineStyle','--', 'LineWidth', 2, 'Color','k');
line([0 1], [mu+sd mu+sd], 'LineStyle','-', 'LineWidth', 2, 'Color','k');
line([0 1], [mu-sd mu-sd], 'LineStyle','-', 'LineWidth', 2, 'Color','k');
% title ('Scatter plot', 'FontSize', 12, 'FontWeight', 'bold');
xlabel ('Ture FA', 'Color', 'k' , 'FontSize', 10, 'FontWeight', 'bold');
ylabel ('FA errors', 'Color', 'k' , 'FontSize', 10, 'FontWeight', 'bold');

 
title('oracleproposed','FontSize', 10, 'FontWeight', 'bold');

