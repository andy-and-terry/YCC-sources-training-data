;; Euler zigzag numbers via the Seidel-Entringer boustrophedon.
(define (step row)
  ;; running sums of the reversed row, starting from 0
  (let loop ((xs (reverse row)) (acc (list 0)))
    (if (null? xs)
        (reverse acc)
        (loop (cdr xs) (cons (+ (car acc) (car xs)) acc)))))

(define (last-elt lst) (if (null? (cdr lst)) (car lst) (last-elt (cdr lst))))

(let loop ((k 0) (row '(1)))
  (when (< k 10)
    (display (last-elt row)) (display " ")
    (loop (+ k 1) (step row))))
(newline)
