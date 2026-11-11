;;; Amicable pairs: d(a) = b and d(b) = a with a /= b.
(defun d (n)
  (loop for i from 1 below n when (zerop (mod n i)) sum i))

(loop for a from 2 below 1500
      for b = (d a)
      when (and (> b a) (= (d b) a))
        do (format t "~d ~d~%" a b))
