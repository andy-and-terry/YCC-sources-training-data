(defparameter *fen-n* 8)
(defparameter *fen-tree* (make-array (1+ *fen-n*) :initial-element 0))

(defun fen-update (i delta)
  (loop while (<= i *fen-n*) do
    (incf (aref *fen-tree* i) delta)
    (incf i (logand i (- i)))))

(defun fen-query (i)
  (let ((sum 0))
    (loop while (> i 0) do
      (incf sum (aref *fen-tree* i))
      (decf i (logand i (- i))))
    sum))

(defun fen-range-query (l r)
  (- (fen-query r) (fen-query (1- l))))

(let ((values #(0 3 2 -1 6 5 4 -3 3))) ; 1-indexed; values[0] is unused
  (loop for i from 1 to *fen-n* do (fen-update i (aref values i))))

(format t "sum 1..5: ~a~%" (fen-query 5))
(format t "sum 3..7: ~a~%" (fen-range-query 3 7))
