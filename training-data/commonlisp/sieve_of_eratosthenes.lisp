(defun sieve (limit)
  (let ((is-prime (make-array (1+ limit) :initial-element t)))
    (setf (aref is-prime 0) nil)
    (setf (aref is-prime 1) nil)
    (loop for n from 2 to (isqrt limit) do
      (when (aref is-prime n)
        (loop for m from (* n n) to limit by n do
          (setf (aref is-prime m) nil))))
    (loop for n from 0 to limit when (aref is-prime n) collect n)))

(print (sieve 50))
