% F6 Function
%
function [Y] = f6(X)
  if (~isfinite(X))
    warning(['Incorrect X values: ' mat2str(X)]);
    Y = -inf;
    return;
  endif
  ssX = sum(X .^ 2);
  Y = 0.5 - ((sin(sqrt(ssX)) .^ 2 - .5) ./ (1 + .001 * ssX) .^ 2);
end
