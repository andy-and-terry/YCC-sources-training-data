(define (affine text a b)
  (list->string
   (map (lambda (ch)
          (if (char-upper-case? ch)
              (integer->char (+ 65 (modulo (+ (* a (- (char->integer ch) 65)) b) 26)))
              ch))
        (string->list text))))

(display (affine "AFFINE" 5 8))
(newline)
