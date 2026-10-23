function game_of_life()
    grid = false(6);
    grid(1, 2) = true; grid(2, 3) = true; grid(3, 1:3) = true;
    for gen = 1:3
        fprintf('Generation %d\n', gen);
        disp(char(grid * ('#' - '.') + '.'));
        grid = step(grid);
    end
end

function next = step(grid)
    n = zeros(size(grid));
    for di = -1:1
        for dj = -1:1
            if di ~= 0 || dj ~= 0
                n = n + circshift(grid, [di dj]);
            end
        end
    end
    next = (grid & (n == 2 | n == 3)) | (~grid & n == 3);
end
