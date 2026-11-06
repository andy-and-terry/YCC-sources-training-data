;;; Fermat primality test; Carmichael number 561 fools it.
(defun powmod (b e m)
  (let ((r 1) (b (mod b m)))
    (loop while (> e 0)
          do (when (oddp e) (setf r (mod (* r b) m)))
             (setf b (mod (* b b) m)
                   e (ash e -1)))
    r))

(defun probably-prime-p (n)
  (and (> n 2) (= (powmod 2 (1- n) n) 1)))

(dolist (n '(97 91 561))
  (format t "~d ~a~%" n (if (probably-prime-p n) "true" "false")))
