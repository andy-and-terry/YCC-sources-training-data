function total = trapping_rain_water(height)
    n = length(height);
    if n == 0
        total = 0;
        return
    end
    leftMax = zeros(1, n);
    rightMax = zeros(1, n);
    leftMax(1) = height(1);
    for i = 2:n
        leftMax(i) = max(leftMax(i - 1), height(i));
    end
    rightMax(n) = height(n);
    for i = n - 1:-1:1
        rightMax(i) = max(rightMax(i + 1), height(i));
    end
    total = sum(min(leftMax, rightMax) - height);
end

disp(trapping_rain_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
