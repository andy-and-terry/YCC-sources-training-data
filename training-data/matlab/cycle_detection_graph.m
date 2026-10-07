function hasCycle = cycle_detection_graph(adj, numNodes)
    % Iterative DFS with an explicit stack so state (0=unvisited,
    % 1=in-progress, 2=done) threads through without needing MATLAB
    % functions to mutate arrays by reference.
    state = zeros(1, numNodes);
    hasCycle = false;
    for start = 1:numNodes
        if state(start) ~= 0
            continue
        end
        stack = [start];
        state(start) = 1;
        while ~isempty(stack)
            node = stack(end);
            advanced = false;
            for neighbor = 1:numNodes
                if adj(node, neighbor) == 1
                    if state(neighbor) == 1
                        hasCycle = true;
                        return
                    elseif state(neighbor) == 0
                        state(neighbor) = 1;
                        stack = [stack, neighbor];
                        advanced = true;
                        break
                    end
                end
            end
            if ~advanced
                state(node) = 2;
                stack(end) = [];
            end
        end
    end
end

adj = [0 1 0; 0 0 1; 1 0 0];
disp(cycle_detection_graph(adj, 3))

acyclic = [0 1 0; 0 0 1; 0 0 0];
disp(cycle_detection_graph(acyclic, 3))
