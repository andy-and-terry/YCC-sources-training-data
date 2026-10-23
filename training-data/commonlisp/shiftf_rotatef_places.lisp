;; shiftf shifts values through places and returns the first old value;
;; rotatef cycles them. Both work on any setf-able place.

(let ((a 1) (b 2) (c 3))
  (let ((old (shiftf a b c 99)))
    (format t "shiftf returned ~a; a=~a b=~a c=~a~%" old a b c)))

(let ((a 1) (b 2) (c 3))
  (rotatef a b c)
  (format t "rotatef: a=~a b=~a c=~a~%" a b c))

;; Places can be array elements or list cells
(let ((v (vector 10 20 30 40)))
  (rotatef (aref v 0) (aref v 3))
  (format t "swapped ends: ~a~%" v))

;; A tiny queue-like history: shift the newest value in, get the oldest out
(defparameter *history* (list nil nil nil))

(defun record (value)
  (shiftf (first *history*) (second *history*) (third *history*) value))

(dolist (x '(a b c d e))
  (let ((dropped (record x)))
    (format t "recorded ~a, dropped ~a, history ~a~%" x dropped *history*)))
