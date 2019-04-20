% Particle Swarm Optimization
%
close all;
clear all;
clc;

# compute start time
st = time();

# cost function
f = @(X) f6(X);

# problem attributes
m = 50;   n = 2;
lw = -100; up = 100;
# number of iterations
num_iterations = 500;
# test parameters
nssz = 10; nrsz = 10;

# global attributes
w = 1; w_damp = .99;
c1 = 2;  c2 = 2;
g = -inf(1, n);
max_v = .2 * (up - lw);
min_v = -max_v;

# statistics attributes
mean_fits = zeros(1, num_iterations); 
best_fits = zeros(1, num_iterations);
best_fits_run = zeros(nrsz, num_iterations);
mean_fits_run = zeros(nrsz, num_iterations);
best_fits_swm = zeros(nssz, num_iterations);
mean_fits_swm = zeros(nssz, num_iterations);

# Swarm loop
for sid = 1:nssz
  # create particles's swarm
  swarm = pso_gsw(m, n, lw, up);
  S_tmp = swarm;
  w_tmp = w;
  g_tmp = g;
  # Run loop
  for rid = 1:nrsz
    # PSO main loop
    for it = 1:num_iterations
      # plot current particle's position (3D contour)
      # pso_plot(f, vertcat(swarm.b), it, lw / 10, .1, up / 10);
      # update particle
      for i = 1:m
        # calculate fitness
        swarm(i).f = f(swarm(i).x);
        # best cognitive fitness
        if (swarm(i).f > swarm(i).p)
          swarm(i).p = swarm(i).f;
          swarm(i).b = swarm(i).x;
          # best social fitness
          if (swarm(i).f > f(g))
            g = swarm(i).x;
          endif
        endif
        # update velocity
        r1 = rand([1 n]); r2 = rand([1 n]);
        cogl = c1 * r1 .* (swarm(i).p - swarm(i).x);
        socl = c2 * r2 .* (g - swarm(i).x);
        swarm(i).v = w * swarm(i).v + cogl + socl;
        # apply velocity limits
        swarm(i).v = max(swarm(i).v, min_v);
        swarm(i).v = min(swarm(i).v, max_v);
        # update position (move)
        swarm(i).x += swarm(i).v;
        # apply position limits
        swarm(i).x = max(swarm(i).x, lw);
        swarm(i).x = min(swarm(i).x, up);
      endfor
      # smooth particle's inertia weight
      w *= w_damp;
      # collect iteration statistics
      z = vertcat(swarm.p);
      best_fits(it) = max(z);
      mean_fits(it) = mean(z);
      # print iteration statistics
      printf('Swarm %02d. Run %02d\n', sid, rid);
      printf('Iteration %02d, mean fitness: %f\n', it, mean_fits(it));
      printf('Best fitness: %f\n\n', best_fits(it));
      fflush(stdout);
    endfor
    best_fits_run(rid, :) = best_fits;
    mean_fits_run(rid, :) = mean_fits;
    swarm = S_tmp;
    w     = w_tmp;
    g     = g_tmp;
  endfor
  best_fits_swm(sid, :) = mean(best_fits_run);
  mean_fits_swm(sid, :) = mean(mean_fits_run);
endfor

# computation time
dt = time() - st;
printf('Computation time: %fs - %fmin\n\n', dt, (dt / 60));

# save results
%csvwrite("PSO_2Ds50.csv", [squeeze((1:num_iterations))' mean(best_fits_swm)' std(best_fits_swm)' ...
%                                                        mean(mean_fits_swm)' std(mean_fits_swm)']);
%csvwrite("PSO_5Ds150.csv", [squeeze((1:num_iterations))' mean(best_fits_swm)' std(best_fits_swm)' ...
%                                                         mean(mean_fits_swm)' std(mean_fits_swm)']);
%csvwrite("PSO_10Ds300.csv", [squeeze((1:num_iterations))' mean(best_fits_swm)' std(best_fits_swm)' ...
%                                                         mean(mean_fits_swm)' std(mean_fits_swm)']);
                                                         
# plot statistics
pso_stat(mean(best_fits_swm), mean(mean_fits_swm), num_iterations);