function moves = tower_of_hanoi(n, from, to, via)
    if n == 0
        moves = 0;
        return
    end
    moves = tower_of_hanoi(n - 1, from, via, to);
    fprintf('Move disk %d from %s to %s\n', n, from, to);
    moves = moves + 1 + tower_of_hanoi(n - 1, via, to, from);
end

disp(tower_of_hanoi(3, 'A', 'C', 'B'))
