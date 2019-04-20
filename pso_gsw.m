% Generate Particle Swarm
%
function [swarm] = pso_gsw(m, n, lw, up)
  swarm = [];
  for i = 1:m
    swarm(i).x = unifrnd(lw, up, [1 n]);
    swarm(i).v = zeros([1 n]);
    swarm(i).f = -inf;
    swarm(i).p = -inf;
    swarm(i).b = swarm(i).x; 
  endfor
endfunction