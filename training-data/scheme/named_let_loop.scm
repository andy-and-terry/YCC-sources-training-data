;; Named let as the idiomatic loop
(define (sum-to n)
  (let loop ((i 1) (acc 0))
    (if (> i n)
        acc
        (loop (+ i 1) (+ acc i)))))

(define (collect-evens lst)
  (let loop ((rest lst) (out '()))
    (cond ((null? rest) (reverse out))
          ((even? (car rest)) (loop (cdr rest) (cons (car rest) out)))
          (else (loop (cdr rest) out)))))

(display (sum-to 100)) (newline)
(display (collect-evens '(1 2 3 4 5 6))) (newline)
