;;; Bulls and Cows scoring for equal-length digit strings.
(defun score (secret guess)
  (let ((bulls 0) (pool '()) (cows 0) (rest-guess '()))
    (loop for s across secret
          for g across guess
          do (if (char= s g)
                 (incf bulls)
                 (progn (push s pool) (push g rest-guess))))
    (dolist (g rest-guess)
      (when (member g pool)
        (incf cows)
        (setf pool (remove g pool :count 1))))
    (values bulls cows)))

(multiple-value-bind (b c) (score "1807" "7810")
  (format t "~d bull(s), ~d cow(s)~%" b c))
