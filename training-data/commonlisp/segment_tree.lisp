(defparameter *seg-n* 8)
(defparameter *seg-tree* (make-array (* 2 *seg-n*) :initial-element 0))

(defun seg-build (arr)
  (loop for i from 0 below *seg-n* do
    (setf (aref *seg-tree* (+ *seg-n* i)) (aref arr i)))
  (loop for i from (1- *seg-n*) downto 1 do
    (setf (aref *seg-tree* i)
          (+ (aref *seg-tree* (* 2 i)) (aref *seg-tree* (1+ (* 2 i)))))))

(defun seg-update (pos value)
  (setf (aref *seg-tree* (+ pos *seg-n*)) value)
  (loop for p = (floor (+ pos *seg-n*) 2) then (floor p 2)
        while (>= p 1) do
    (setf (aref *seg-tree* p)
          (+ (aref *seg-tree* (* 2 p)) (aref *seg-tree* (1+ (* 2 p)))))))

(defun seg-query (l r)
  (let ((sum 0) (lo (+ l *seg-n*)) (hi (+ r *seg-n* 1)))
    (loop while (< lo hi) do
      (when (oddp lo) (incf sum (aref *seg-tree* lo)) (incf lo))
      (when (oddp hi) (decf hi) (incf sum (aref *seg-tree* hi)))
      (setf lo (floor lo 2))
      (setf hi (floor hi 2)))
    sum))

(seg-build #(1 3 5 7 9 11 13 15))
(format t "~a~%" (seg-query 1 5))
(seg-update 2 10)
(format t "~a~%" (seg-query 1 5))
