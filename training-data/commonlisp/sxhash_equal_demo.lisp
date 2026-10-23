;; sxhash returns a non-negative fixnum hash that is consistent with
;; EQUAL: objects that are EQUAL must have the same hash.
(let ((a "hello")
      (b (copy-seq "hello")))
  (format t "eq: ~a equal: ~a~%" (eq a b) (equal a b))
  (format t "same hash: ~a~%" (= (sxhash a) (sxhash b))))

(format t "lists: ~a~%" (= (sxhash '(1 2 (3))) (sxhash (list 1 2 (list 3)))))
(format t "fixnum: ~a~%" (typep (sxhash "abc") 'fixnum))
(format t "non-negative: ~a~%" (>= (sxhash 'symbol) 0))

;; Different objects usually, but not necessarily, differ in hash.
(format t "strings differ: ~a~%" (equal "abc" "abd"))
