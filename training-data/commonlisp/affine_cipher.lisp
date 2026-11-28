(defun affine (text a b &optional decrypt)
  (let ((inv (loop for x from 1 below 26 when (= 1 (mod (* a x) 26)) return x)))
    (map 'string
         (lambda (ch)
           (if (upper-case-p ch)
               (let* ((x (- (char-code ch) 65))
                      (y (if decrypt (mod (* inv (- x b)) 26) (mod (+ (* a x) b) 26))))
                 (code-char (+ y 65)))
               ch))
         text)))

(let ((c (affine "AFFINE" 5 8)))
  (format t "~a ~a~%" c (affine c 5 8 t)))
