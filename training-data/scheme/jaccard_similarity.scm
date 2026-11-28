(define (member? x lst) (and (member x lst) #t))

(define (uniq lst)
  (let loop ((l lst) (acc '()))
    (cond ((null? l) (reverse acc))
          ((member? (car l) acc) (loop (cdr l) acc))
          (else (loop (cdr l) (cons (car l) acc))))))

(define (jaccard a b)
  (let* ((ua (uniq a))
         (inter (filter (lambda (x) (member? x b)) ua))
         (union (uniq (append a b))))
    (/ (length inter) (length union))))

(display (jaccard '(1 2 3 4) '(3 4 5)))
(newline)
