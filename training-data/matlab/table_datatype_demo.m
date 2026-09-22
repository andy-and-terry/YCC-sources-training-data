names = {'Alice'; 'Bob'; 'Carol'};
ages = [30; 25; 35];
scores = [88; 92; 79];

t = table(names, ages, scores, 'VariableNames', {'Name', 'Age', 'Score'});
disp(t)

highScorers = t(t.Score > 80, :);
disp(highScorers)

fprintf('average score: %.2f\n', mean(t.Score));

sortedTable = sortrows(t, 'Score', 'descend');
disp(sortedTable)
