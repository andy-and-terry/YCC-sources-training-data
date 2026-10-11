(defun compare (a b)
  (format t "~12s ~12s eq=~5a eql=~5a equal=~5a equalp=~5a~%"
          a b (eq a b) (eql a b) (equal a b) (equalp a b)))

(compare 'a 'a)
(compare 3 3)
(compare 3 3.0)
(compare "abc" "abc")
(compare "abc" "ABC")
(compare '(1 2) '(1 2))
(compare #\a #\A)
(compare 1.5 1.5)
