classdef Button < handle
    events
        Clicked
    end
    properties
        label
    end
    methods
        function obj = Button(label)
            obj.label = label;
        end
        function press(obj)
            notify(obj, 'Clicked');
        end
    end
end
