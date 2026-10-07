function switch_case_classifier()
    inputs = {'apple', 'carrot', 3, 'zzz', 'Banana'};
    for k = 1:numel(inputs)
        fprintf('%s\n', classify(inputs{k}));
    end
end

function out = classify(x)
    if ischar(x)
        switch lower(x)
            case {'apple', 'banana'}
                out = 'fruit';
            case 'carrot'
                out = 'vegetable';
            otherwise
                out = 'unknown food';
        end
    else
        switch x
            case 1
                out = 'one';
            case {2, 3}
                out = 'two or three';
            otherwise
                out = 'number';
        end
    end
end
