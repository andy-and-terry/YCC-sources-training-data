(defun hanoi (n from via to)
  (if (zerop n)
      nil
      (append (hanoi (1- n) from to via)
              (list (list from to))
              (hanoi (1- n) via from to))))

(let ((m (hanoi 3 'a 'b 'c)))
  (format t "~d: ~a~%" (length m) m))
