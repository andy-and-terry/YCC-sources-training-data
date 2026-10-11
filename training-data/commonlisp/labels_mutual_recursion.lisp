(defun parity (n)
  (labels ((my-even-p (k) (if (zerop k) t (my-odd-p (1- k))))
           (my-odd-p (k) (if (zerop k) nil (my-even-p (1- k)))))
    (if (my-even-p n) :even :odd)))

(format t "~a ~a ~a~%" (parity 0) (parity 7) (parity 10))

(defun collatz-length (n)
  (labels ((walk (k steps)
             (cond ((= k 1) steps)
                   ((evenp k) (walk (/ k 2) (1+ steps)))
                   (t (walk (1+ (* 3 k)) (1+ steps))))))
    (walk n 0)))

(format t "~a~%" (collatz-length 27))
