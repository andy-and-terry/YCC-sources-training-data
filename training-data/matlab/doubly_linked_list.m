classdef doubly_linked_list < handle
    properties
        Value
        Prev
        Next
    end
    methods
        function obj = doubly_linked_list(value)
            obj.Value = value;
            obj.Prev = [];
            obj.Next = [];
        end

        function tail = append(obj, value)
            node = doubly_linked_list(value);
            current = obj;
            while ~isempty(current.Next)
                current = current.Next;
            end
            current.Next = node;
            node.Prev = current;
            tail = node;
        end

        function list = toArray(obj)
            list = [];
            current = obj;
            while ~isempty(current)
                list(end + 1) = current.Value;
                current = current.Next;
            end
        end
    end
end

head = doubly_linked_list(1);
head.append(2);
head.append(3);
disp(head.toArray())
