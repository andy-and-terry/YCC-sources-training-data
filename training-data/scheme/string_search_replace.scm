;; Substring search and replacement written with plain string primitives.

(define (string-prefix-at? s pat i)
  (let ((n (string-length pat)))
    (and (<= (+ i n) (string-length s))
         (string=? (substring s i (+ i n)) pat))))

(define (string-find s pat)
  (let loop ((i 0))
    (cond ((> (+ i (string-length pat)) (string-length s)) #f)
          ((string-prefix-at? s pat i) i)
          (else (loop (+ i 1))))))

(define (string-replace-all s pat rep)
  (let loop ((i 0) (acc ""))
    (cond ((>= i (string-length s)) acc)
          ((and (> (string-length pat) 0) (string-prefix-at? s pat i))
           (loop (+ i (string-length pat)) (string-append acc rep)))
          (else (loop (+ i 1) (string-append acc (string (string-ref s i))))))))

(define (string-count s pat)
  (let loop ((i 0) (n 0))
    (cond ((>= i (string-length s)) n)
          ((string-prefix-at? s pat i) (loop (+ i (string-length pat)) (+ n 1)))
          (else (loop (+ i 1) n)))))

(define text "the cat sat on the mat with the hat")
(display (string-find text "sat")) (newline)
(display (string-find text "dog")) (newline)
(display (string-replace-all text "the" "a")) (newline)
(display (string-count text "at")) (newline)
