(print (loop for i from 1 to 10 collect i))
(print (loop for i from 1 to 10 when (evenp i) collect (* i i)))
(print (loop for i from 1 to 5 sum i))
