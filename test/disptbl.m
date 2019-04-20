% Show values like a table
%
function disptbl(d, V, int)
  p  = find(mod(V(:, 1), int) == 0 | V(:, 1) == 1);
  x  = p;
  y  = V(p, 2);
  y1 = V(p, 3);
  z  = V(p, 4);
  z1 = V(p, 5);
  disp(d);
  disp([x y y1 z z1]);
  printf("AVG %f %f %f %f\n", mean(V(:, 2)), mean(V(:, 3)), mean(V(:, 4)), mean(V(:, 5)));
  fflush(stdout);
end