classdef Vector2D
    properties
        x
        y
    end
    methods
        function obj = Vector2D(x, y)
            obj.x = x;
            obj.y = y;
        end
        function result = plus(a, b)
            result = Vector2D(a.x + b.x, a.y + b.y);
        end
        function result = eq(a, b)
            result = (a.x == b.x) && (a.y == b.y);
        end
        function s = char(obj)
            s = sprintf('(%g, %g)', obj.x, obj.y);
        end
    end
end
