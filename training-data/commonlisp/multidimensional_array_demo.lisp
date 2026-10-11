(let ((grid (make-array '(3 4) :initial-element 0)))
  (dotimes (r 3)
    (dotimes (c 4)
      (setf (aref grid r c) (* (1+ r) (1+ c)))))
  (format t "rank ~a dims ~a total ~a~%"
          (array-rank grid) (array-dimensions grid) (array-total-size grid))
  (dotimes (r 3)
    (format t "~{~3d~}~%"
            (loop for c below 4 collect (aref grid r c))))
  (format t "row-major 5: ~a~%" (row-major-aref grid 5))
  (format t "~a~%" (array-in-bounds-p grid 3 0)))
