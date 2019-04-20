% Plot PSO status
%
function [] = pso_plot(f, x, num_iterations, lw, step, up)
  X = lw:step:up;
  Y = lw:step:up;
  [X, Y] = meshgrid(X, Y);
  Zt = [X(:) Y(:)];
  Z = f(Zt');
  Z = reshape(Z, sqrt(length(Zt)), sqrt(length(Zt)));
  colormap('gray');
  contour(X, Y, Z, 6, 'linewidth', 1, 'linecolor', 'b');
  c = get(gcf, "currentaxes");
  set(c, "fontsize", 15, "linewidth", 2);
  hold on;
  plot(x(:, 1), x(:, 2), 'k^', 'markerfacecolor', 'r', 'markersize', 8);
  title(sprintf('Swarm after %03d iterations', num_iterations));
  legend('Space', 'Particle');
  xlabel('X');
  ylabel('Y');
  zlabel('Fitness');
  axis([lw up lw up]);
  hold off;
  refresh;
endfunction