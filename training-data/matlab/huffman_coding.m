function codes = huffman_coding(symbols, freqs)
    nodes = cell(1, numel(symbols));
    for i = 1:numel(symbols)
        nodes{i} = struct('symbol', symbols(i), 'freq', freqs(i), 'left', [], 'right', []);
    end

    while numel(nodes) > 1
        [~, order] = sort(cellfun(@(n) n.freq, nodes));
        nodes = nodes(order);
        a = nodes{1}; b = nodes{2};
        merged = struct('symbol', '*', 'freq', a.freq + b.freq, 'left', a, 'right', b);
        nodes = [{merged}, nodes(3:end)];
    end

    codes = struct();
    assign_codes(nodes{1}, '');

    function assign_codes(node, prefix)
        if isempty(node.left) && isempty(node.right)
            codes.(node.symbol) = prefix;
        else
            assign_codes(node.left, [prefix, '0']);
            assign_codes(node.right, [prefix, '1']);
        end
    end
end

codes = huffman_coding(['a', 'b', 'c', 'd'], [5, 9, 12, 13]);
disp(codes)
