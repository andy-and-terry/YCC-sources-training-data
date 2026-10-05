(defun shift-char (c k)
  (cond ((upper-case-p c)
         (code-char (+ 65 (mod (+ (- (char-code c) 65) k) 26))))
        ((lower-case-p c)
         (code-char (+ 97 (mod (+ (- (char-code c) 97) k) 26))))
        (t c)))

(defun caesar (text k)
  (map 'string (lambda (c) (shift-char c k)) text))

(let ((enc (caesar "Hello, World!" 3)))
  (print enc)
  (print (caesar enc -3)))
