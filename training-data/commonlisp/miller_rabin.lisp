(defun power-mod (base exp m)
  (let ((result 1) (b (mod base m)) (e exp))
    (loop while (> e 0) do
      (when (oddp e) (setf result (mod (* result b) m)))
      (setf b (mod (* b b) m))
      (setf e (ash e -1)))
    result))

(defun miller-rabin-witness-p (a d n r)
  (let ((x (power-mod a d n)))
    (when (or (= x 1) (= x (1- n)))
      (return-from miller-rabin-witness-p nil))
    (dotimes (i (1- r))
      (setf x (mod (* x x) n))
      (when (= x (1- n))
        (return-from miller-rabin-witness-p nil)))
    t))

(defun primep (n)
  (cond
    ((< n 2) nil)
    ((member n '(2 3 5 7 11 13)) t)
    ((some (lambda (p) (zerop (mod n p))) '(2 3 5 7 11 13)) nil)
    (t
     (let ((d (1- n)) (r 0))
       (loop while (evenp d) do (setf d (floor d 2)) (incf r))
       (notany (lambda (a) (miller-rabin-witness-p a d n r))
               '(2 3 5 7 11 13 17 19 23 29 31 37))))))

(print (primep 97))
(print (primep 561))
(print (primep 1000000007))
(print (primep 91))
