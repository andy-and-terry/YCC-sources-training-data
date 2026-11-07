(define (insert-interval ivs new)
  (let loop ((ivs ivs) (lo (car new)) (hi (cadr new)) (before '()))
    (cond ((null? ivs) (reverse (cons (list lo hi) before)))
          ((< (cadar ivs) lo) (loop (cdr ivs) lo hi (cons (car ivs) before)))
          ((<= (caar ivs) hi)
           (loop (cdr ivs) (min lo (caar ivs)) (max hi (cadar ivs)) before))
          (else (append (reverse (cons (list lo hi) before)) ivs)))))

(display (insert-interval '((1 3) (6 9)) '(2 5))) (newline) ; ((1 5) (6 9))
