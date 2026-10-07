function path = a_star_search(adj, heuristic, start, goal, numNodes)
    openSet = [start];
    gScore = Inf(1, numNodes);
    gScore(start) = 0;
    cameFrom = zeros(1, numNodes);

    while ~isempty(openSet)
        [~, idx] = min(gScore(openSet) + heuristic(openSet));
        current = openSet(idx);
        if current == goal
            path = reconstruct_path(cameFrom, current);
            return
        end
        openSet(idx) = [];
        for neighbor = 1:numNodes
            if adj(current, neighbor) > 0
                tentative = gScore(current) + adj(current, neighbor);
                if tentative < gScore(neighbor)
                    cameFrom(neighbor) = current;
                    gScore(neighbor) = tentative;
                    if ~ismember(neighbor, openSet)
                        openSet = [openSet, neighbor];
                    end
                end
            end
        end
    end
    path = [];
end

function path = reconstruct_path(cameFrom, current)
    path = [current];
    while cameFrom(current) ~= 0
        current = cameFrom(current);
        path = [current, path];
    end
end

adj = [0 1 4 0; 1 0 2 5; 4 2 0 1; 0 5 1 0];
heuristic = [3 2 1 0];
path = a_star_search(adj, heuristic, 1, 4, 4);
disp(path)
