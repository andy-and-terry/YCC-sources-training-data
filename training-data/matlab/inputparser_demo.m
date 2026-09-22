function summary = describe_person(varargin)
    parser = inputParser;
    addRequired(parser, 'name', @ischar);
    addOptional(parser, 'age', 18, @isnumeric);
    addParameter(parser, 'city', 'Unknown', @ischar);
    parse(parser, varargin{:});

    args = parser.Results;
    summary = sprintf('%s (%d) from %s', args.name, args.age, args.city);
end

disp(describe_person('Alice', 30, 'city', 'Denver'))
disp(describe_person('Bob'))
