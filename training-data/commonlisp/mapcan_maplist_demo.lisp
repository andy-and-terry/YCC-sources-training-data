(defun evens-only (list)
  (mapcan (lambda (x) (if (evenp x) (list x) nil)) list))

(format t "~a~%" (evens-only '(1 2 3 4 5 6)))

;; maplist passes successive tails of the list
(format t "~a~%" (maplist #'identity '(a b c)))
(format t "~a~%" (maplist (lambda (tail) (length tail)) '(a b c d)))

;; adjacent pairs using maplist
(defun adjacent-pairs (list)
  (loop for tail on list
        while (cdr tail)
        collect (list (first tail) (second tail))))

(format t "~a~%" (adjacent-pairs '(1 2 3 4)))
(mapc (lambda (x y) (format t "~a-~a " x y)) '(1 2 3) '(a b c))
(terpri)
