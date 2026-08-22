(defun fib (n)
  (loop with a = 0 and b = 1
        repeat n
        do (psetf a b b (+ a b))
        finally (return a)))

(dotimes (i 11)
  (format t "~a " (fib i)))
(terpri)
