(print (char-code #\A))
(print (code-char 97))
(print (char-upcase #\a))
(print (digit-char-p #\7))
(print (digit-char 5))
(print (alpha-char-p #\z))
(print (char< #\a #\b))

;; Caesar shift using char codes
(defun caesar (str shift)
  (map 'string
       (lambda (c)
         (if (lower-case-p c)
             (code-char (+ 97 (mod (+ (- (char-code c) 97) shift) 26)))
             c))
       str))

(print (caesar "hello, world" 3))
(print (caesar (caesar "hello" 3) -3))
(terpri)
