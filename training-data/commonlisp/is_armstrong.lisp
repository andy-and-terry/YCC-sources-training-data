(defun armstrong-p (n)
  (let* ((digits (map 'list (lambda (c) (- (char-code c) (char-code #\0))) (write-to-string n)))
         (power (length digits)))
    (= n (reduce #'+ (mapcar (lambda (d) (expt d power)) digits)))))

(print (armstrong-p 153))
(print (armstrong-p 123))
