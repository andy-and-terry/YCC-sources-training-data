function [dist, has_negative_cycle] = bellman_ford(n, edges, source)
    dist = Inf(1, n);
    dist(source) = 0;

    for i = 1:(n - 1)
        for e = 1:size(edges, 1)
            u = edges(e, 1);
            v = edges(e, 2);
            w = edges(e, 3);
            if dist(u) + w < dist(v)
                dist(v) = dist(u) + w;
            end
        end
    end

    has_negative_cycle = false;
    for e = 1:size(edges, 1)
        u = edges(e, 1);
        v = edges(e, 2);
        w = edges(e, 3);
        if dist(u) + w < dist(v)
            has_negative_cycle = true;
        end
    end
end

edges = [1 2 4; 1 3 5; 2 3 -3; 3 4 4; 2 4 6];
[dist, has_negative_cycle] = bellman_ford(4, edges, 1);
disp(dist)
disp(has_negative_cycle)
