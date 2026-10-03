function [dist, hasNegCycle] = bellman_ford(edges, numNodes, source)
    dist = Inf(1, numNodes);
    dist(source) = 0;
    for i = 1:numNodes - 1
        for e = 1:size(edges, 1)
            u = edges(e, 1); v = edges(e, 2); w = edges(e, 3);
            if dist(u) + w < dist(v)
                dist(v) = dist(u) + w;
            end
        end
    end
    hasNegCycle = false;
    for e = 1:size(edges, 1)
        u = edges(e, 1); v = edges(e, 2); w = edges(e, 3);
        if dist(u) + w < dist(v)
            hasNegCycle = true;
        end
    end
end

edges = [1 2 4; 1 3 1; 3 2 2; 2 4 5; 3 4 8];
[dist, hasNegCycle] = bellman_ford(edges, 4, 1);
disp(dist)
disp(hasNegCycle)
