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
        function r = plus(a, b)
            r = Vector2D(a.x + b.x, a.y + b.y);
        end
        function r = minus(a, b)
            r = Vector2D(a.x - b.x, a.y - b.y);
        end
        function tf = eq(a, b)
            tf = (a.x == b.x) && (a.y == b.y);
        end
        function s = char(obj)
            s = sprintf('(%g, %g)', obj.x, obj.y);
        end
    end
end
