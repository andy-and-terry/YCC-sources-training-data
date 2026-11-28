(define (fletcher16 s)
  (let loop ((cs (string->list s)) (a 0) (b 0))
    (if (null? cs)
        (+ (* b 256) a)
        (let ((a2 (modulo (+ a (char->integer (car cs))) 255)))
          (loop (cdr cs) a2 (modulo (+ b a2) 255))))))

(display (number->string (fletcher16 "abcde") 16))
(newline)
