% Plot PSO statistics
%
function pso_stat(best_fits, mean_fits, num_iterations)
  t = 1:num_iterations;
  figure;
  plot(t, best_fits, '-b', 'linewidth', 2.5, ...
       t, mean_fits, '-r', 'linewidth', 2.5);
  g = get(gcf, 'currentaxes');
  set(g, "fontsize", 15, "linewidth", 2);
  h = legend('Best fitness', 'Mean fitness', 'location', 'southeast');
  set(h, 'fontsize', 15); 
  title('PSO Convergence by Iteration');
  xlabel('Iteration');
  ylabel('Fitness');
endfunction