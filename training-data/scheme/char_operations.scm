;; Character predicates and conversions
(define (count-if pred str)
  (let loop ((i 0) (n 0))
    (if (= i (string-length str))
        n
        (loop (+ i 1) (if (pred (string-ref str i)) (+ n 1) n)))))

(define s "Hello World 123")
(display (count-if char-alphabetic? s)) (newline)
(display (count-if char-numeric? s)) (newline)
(display (count-if char-whitespace? s)) (newline)
(display (count-if char-upper-case? s)) (newline)
(display (char->integer #\A)) (newline)
(display (integer->char 98)) (newline)
(display (char-upcase #\q)) (newline)
(display (list->string (map char-downcase (string->list s)))) (newline)
