(define (safe? queens col)
  (define n (length queens))
  (let loop ((i 0) (rest queens))
    (cond
      ((null? rest) #t)
      ((or (= (car rest) col) (= (abs (- (car rest) col)) (- n i))) #f)
      (else (loop (+ i 1) (cdr rest))))))

(define (solve queens n)
  (if (= (length queens) n)
      1
      (apply + (map (lambda (col) (if (safe? queens col) (solve (append queens (list col)) n) 0))
                     (iota n)))))

(define (iota n) (let loop ((i 0) (acc '())) (if (= i n) (reverse acc) (loop (+ i 1) (cons i acc)))))

(display (solve '() 6))
(newline)
