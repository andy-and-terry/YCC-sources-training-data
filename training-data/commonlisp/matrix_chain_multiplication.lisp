(defun matrix-chain-order (dims)
  (let* ((n (1- (length dims)))
         (dims-vec (coerce dims 'vector))
         (dp (make-array (list (1+ n) (1+ n)) :initial-element 0)))
    (loop for len from 2 to n do
      (loop for i from 1 to (- n len -1) do
        (let ((j (+ i len -1)))
          (setf (aref dp i j) most-positive-fixnum)
          (loop for k from i below j do
            (let ((cost (+ (aref dp i k)
                            (aref dp (1+ k) j)
                            (* (aref dims-vec (1- i)) (aref dims-vec k) (aref dims-vec j)))))
              (when (< cost (aref dp i j))
                (setf (aref dp i j) cost)))))))
    (aref dp 1 n)))

;; Matrices: 40x20, 20x30, 30x10, 10x30 -> dims = (40 20 30 10 30)
(format t "minimum multiplication cost: ~a~%" (matrix-chain-order '(40 20 30 10 30)))
