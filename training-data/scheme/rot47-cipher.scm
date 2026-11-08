(define (rot47-char c)
  (let ((n (char->integer c)))
    (if (and (>= n 33) (<= n 126))
        (integer->char (+ 33 (modulo (+ (- n 33) 47) 94)))
        c)))

(define (rot47 s) (list->string (map rot47-char (string->list s))))

(display (rot47 "Hello, World!"))
(newline)
(display (rot47 (rot47 "Hello, World!")))
(newline)
