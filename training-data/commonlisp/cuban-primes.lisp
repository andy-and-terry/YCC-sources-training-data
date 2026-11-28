(defun primep (n)
  (and (> n 1)
       (loop for i from 2 to (isqrt n) never (zerop (mod n i)))))

(format t "~{~a~^ ~}~%"
        (loop for y from 1
              for p = (+ (* 3 y y) (* 3 y) 1)
              when (primep p) collect p into found
              until (= (length found) 8)
              finally (return found)))
