(defun valid-parens-p (s)
  (let ((stack '()))
    (loop for ch across s do
      (case ch
        ((#\( #\[ #\{) (push ch stack))
        (#\) (unless (and stack (eql (pop stack) #\()) (return-from valid-parens-p nil)))
        (#\] (unless (and stack (eql (pop stack) #\[)) (return-from valid-parens-p nil)))
        (#\} (unless (and stack (eql (pop stack) #\{)) (return-from valid-parens-p nil)))))
    (null stack)))

(print (valid-parens-p "({[]})"))
(print (valid-parens-p "(]"))
