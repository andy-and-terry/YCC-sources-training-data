;; Classic accumulate/fold-right style abstractions (SICP flavour).

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))

(define (flatmap f seq)
  (accumulate append '() (map f seq)))

(define (enumerate-interval a b)
  (if (> a b) '() (cons a (enumerate-interval (+ a 1) b))))

(define (prime-sum-pairs n)
  (define (prime? x)
    (and (> x 1)
         (let loop ((d 2))
           (cond ((> (* d d) x) #t)
                 ((= 0 (remainder x d)) #f)
                 (else (loop (+ d 1)))))))
  (filter (lambda (p) (prime? (+ (car p) (cadr p))))
          (flatmap (lambda (i)
                     (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(write (accumulate + 0 '(1 2 3 4))) (newline)
(write (accumulate cons '() '(1 2 3))) (newline)
(write (prime-sum-pairs 5)) (newline)
