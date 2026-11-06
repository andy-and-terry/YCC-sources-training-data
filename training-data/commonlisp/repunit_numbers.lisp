;;; Repunits: numbers made only of the digit 1.
(let ((r 0))
  (dotimes (i 5)
    (setf r (+ (* r 10) 1))
    (format t "~d " r))
  (terpri))
