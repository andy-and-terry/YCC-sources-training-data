classdef MathUtils
    properties (Constant)
        Gravity = 9.81
    end
    methods (Static)
        function f = celsiusToFahrenheit(c)
            f = c * 9 / 5 + 32;
        end
        function d = fallDistance(t)
            d = 0.5 * MathUtils.Gravity * t ^ 2;
        end
    end
end
