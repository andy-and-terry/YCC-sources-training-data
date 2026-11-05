(print (loop for i from 1 to 10
             when (evenp i) collect i into evens
             else collect i into odds
             finally (return (list evens odds))))
