function count = next_id()
    persistent counter;
    if isempty(counter)
        counter = 0;
    end
    counter = counter + 1;
    count = counter;
end

for i = 1:5
    fprintf('id: %d\n', next_id());
end
