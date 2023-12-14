// Returns the Perlin noise value for an arbitrary point.
function v = perlin(p)
  v = 0;
  for dirs = [dec2bin(0:(2 ^ length(p) - 1)) - 48]'
    q = floor(p) + dirs'; % This iteration's corner
    g = qgradient(q); % This corner's gradient
    m = dot(g, p - q);
    t = 1.0 - abs(p - q);
    v += m * prod(3 * t .^ 2 - 2 * t .^ 3);
  end
end
