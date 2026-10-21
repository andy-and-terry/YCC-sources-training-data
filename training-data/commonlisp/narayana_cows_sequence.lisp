;;; Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
(defun narayana-cows (count)
  (let ((n (list 1 1 1)))
    (loop for i from 3 below count
          do (setf n (append n (list (+ (nth (- i 1) n) (nth (- i 3) n))))))
    n))

(format t "~{~d~^ ~}~%" (narayana-cows 15))
