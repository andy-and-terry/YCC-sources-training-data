function shoelace_polygon_area()
  x = [0 4 4 0];
  y = [0 0 3 3];
  xn = circshift(x, -1);
  yn = circshift(y, -1);
  area = abs(sum(x .* yn - xn .* y)) / 2;
  fprintf('%g\n', area);
end
