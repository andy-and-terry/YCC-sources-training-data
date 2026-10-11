(let ((h (make-hash-table :test 'equal)))
  (setf (gethash "apple" h) 3
        (gethash "pear" h) 5
        (gethash "fig" h) 1)
  (loop for k being the hash-keys of h using (hash-value v)
        summing v into total
        collect k into keys
        finally (format t "~a total=~a~%" (sort keys #'string<) total))
  (loop for v being the hash-values of h
        maximize v into biggest
        finally (format t "max=~a~%" biggest)))
