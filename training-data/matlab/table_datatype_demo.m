names = {'Alice'; 'Bob'; 'Carol'};
scores = [92; 78; 85];
grade = repmat({''}, numel(scores), 1);
for i = 1:numel(scores)
    if scores(i) >= 90
        grade{i} = 'A';
    elseif scores(i) >= 80
        grade{i} = 'B';
    else
        grade{i} = 'C';
    end
end

results = table(names, scores, grade, 'VariableNames', {'Name', 'Score', 'Grade'});
disp(results)
disp(results(results.Score > 80, :))
disp(mean(results.Score))
