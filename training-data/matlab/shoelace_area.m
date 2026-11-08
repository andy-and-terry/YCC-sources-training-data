function a = shoelace_area(x, y)
    x2 = circshift(x, -1);
    y2 = circshift(y, -1);
    a = abs(sum(x .* y2 - x2 .* y)) / 2;
end
