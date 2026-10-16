;; Split a string into words by hand and count word lengths.

(define (tokenize str)
  (let loop ((cs (string->list str)) (cur '()) (acc '()))
    (define (flush)
      (if (null? cur) acc (cons (list->string (reverse cur)) acc)))
    (cond ((null? cs) (reverse (flush)))
          ((char-alphabetic? (car cs))
           (loop (cdr cs) (cons (char-downcase (car cs)) cur) acc))
          (else (loop (cdr cs) '() (flush))))))

(define words (tokenize "The quick brown fox, the lazy dog; THE end."))

(display words) (newline)
(display (length words)) (newline)
(display (map string-length words)) (newline)
(display (apply max (map string-length words))) (newline)
