(defun permutations (lst)
  (if (null lst)
      '(())
      (mapcan
        (lambda (x)
          (mapcar (lambda (p) (cons x p))
                  (permutations (remove x lst :count 1))))
        lst)))

(dolist (p (permutations '(1 2 3)))
  (format t "~a~%" p))
