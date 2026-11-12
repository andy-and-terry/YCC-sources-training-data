(print (loop for i from 1 to 10 when (evenp i) collect (* i i)))
(print (loop for x in '(3 1 4 1 5) maximize x))
(print (loop for i below 5 sum i))
