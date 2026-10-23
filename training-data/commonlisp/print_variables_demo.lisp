;; The printer is controlled by special variables; binding them with LET
;; changes output for a dynamic extent only.
(let ((*print-base* 2)) (print 10))
(let ((*print-base* 16)) (print 255))
(let ((*print-base* 16) (*print-radix* t)) (print 255))
(terpri)

(let ((*print-case* :downcase)) (prin1 '(Hello World)) (terpri))
(let ((*print-case* :capitalize)) (prin1 '(Hello World)) (terpri))

(let ((*print-escape* nil)) (prin1 "no quotes") (terpri))
(prin1 "with quotes") (terpri)

;; Truncate long structures.
(let ((*print-length* 3)) (prin1 '(1 2 3 4 5 6)) (terpri))
(let ((*print-level* 2)) (prin1 '(1 (2 (3 (4))))) (terpri))

;; Control the format of floats and arrays.
(let ((*read-default-float-format* 'double-float))
  (prin1 1.5d0) (terpri))
(let ((*print-array* nil)) (prin1 (make-array 3)) (terpri))

;; Capture printed output as a string.
(format t "~a~%" (let ((*print-base* 8)) (princ-to-string 64)))
(format t "~a~%" (let ((*print-pretty* nil)) (prin1-to-string '(a . b))))
