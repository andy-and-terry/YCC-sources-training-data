function moves = hanoi_move_list(n, a, b, c)
    if n == 0
        moves = {};
        return;
    end
    moves = [hanoi_move_list(n-1, a, c, b), {sprintf('%s->%s', a, c)}, hanoi_move_list(n-1, b, a, c)];
end
