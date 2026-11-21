;;; Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
(defun pow-mod (b e m)
  (let ((r 1) (b (mod b m)))
    (loop while (> e 0)
          do (when (oddp e) (setf r (mod (* r b) m)))
             (setf b (mod (* b b) m)
                   e (ash e -1)))
    r))

(defun primep (n)
  (and (> n 1)
       (loop for p from 2 while (<= (* p p) n) never (zerop (mod n p)))))

(defun carmichael-p (n)
  (and (not (primep n))
       (loop for a from 2 below n
             always (or (/= 1 (gcd a n)) (= 1 (pow-mod a (1- n) n))))))

(format t "~{~a~^ ~}~%" (loop for n from 3 below 3000 by 2 when (carmichael-p n) collect n))
