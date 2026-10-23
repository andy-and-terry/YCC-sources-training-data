(defun partition-numbers (numbers)
  (loop for n in numbers
        if (evenp n) collect n into evens
        else collect n into odds
        finally (return (list evens odds))))

(print (partition-numbers '(1 2 3 4 5 6)))
(print (loop for x in '(3 1 4 1 5) maximize x))
(print (loop for i from 1 to 5 sum (* i i)))
(print (loop for (k v) on '(:a 1 :b 2) by #'cddr collect (cons k v)))
