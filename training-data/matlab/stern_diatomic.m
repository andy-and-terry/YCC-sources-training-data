function stern_diatomic()
    count = 15;
    seq = zeros(1, count);
    seq(2) = 1;                  % seq(i + 1) holds s(i)
    for i = 2:count - 1
        h = floor(i / 2);
        if mod(i, 2) == 0
            seq(i + 1) = seq(h + 1);
        else
            seq(i + 1) = seq(h + 1) + seq(h + 2);
        end
    end
    disp(seq); % 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
end
