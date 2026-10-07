classdef Counter < handle
    properties
        value = 0
    end
    methods
        function obj = Counter(startValue)
            if nargin > 0
                obj.value = startValue;
            end
        end
        function increment(obj)
            obj.value = obj.value + 1;
        end
    end
end
