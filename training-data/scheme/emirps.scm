(define (prime? n)
  (and (>= n 2)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (modulo n d)) #f)
               (else (loop (+ d 1)))))))

(define (rev n) (string->number (list->string (reverse (string->list (number->string n))))))

(define (collect n left acc)
  (cond ((zero? left) (reverse acc))
        ((let ((r (rev n))) (and (not (= r n)) (prime? n) (prime? r)))
         (collect (+ n 1) (- left 1) (cons n acc)))
        (else (collect (+ n 1) left acc))))

(display (collect 2 10 '())) (newline) ; (13 17 31 37 71 73 79 97 107 113)
