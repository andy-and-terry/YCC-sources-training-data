;;; Amicable pairs below 1500 via sums of proper divisors.
(defun s (n)
  (loop for d from 1 below n when (zerop (mod n d)) sum d))

(loop for a from 2 below 1500
      for b = (s a)
      when (and (> b a) (= (s b) a))
        do (format t "~a ~a~%" a b))
