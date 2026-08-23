classdef Rectangle
    properties
        width
        height
    end
    methods
        function obj = Rectangle(w, h)
            obj.width = w;
            obj.height = h;
        end
        function a = area(obj)
            a = obj.width * obj.height;
        end
    end
end
