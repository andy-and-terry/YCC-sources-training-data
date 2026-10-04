;; Merge sort parameterized by a comparison predicate, applied to records.

(define (merge-lists a b less?)
  (cond ((null? a) b)
        ((null? b) a)
        ((less? (car b) (car a)) (cons (car b) (merge-lists a (cdr b) less?)))
        (else (cons (car a) (merge-lists (cdr a) b less?)))))

(define (split lst)
  (if (or (null? lst) (null? (cdr lst)))
      (values lst '())
      (let-values (((a b) (split (cddr lst))))
        (values (cons (car lst) a) (cons (cadr lst) b)))))

(define (sort-by lst less?)
  (if (or (null? lst) (null? (cdr lst)))
      lst
      (let-values (((a b) (split lst)))
        (merge-lists (sort-by a less?) (sort-by b less?) less?))))

(define people '(("cy" 31) ("ann" 25) ("bo" 31) ("di" 19)))

(define (by-age a b) (< (cadr a) (cadr b)))
(define (by-name a b) (string<? (car a) (car b)))
(define (by-age-desc-then-name a b)
  (or (> (cadr a) (cadr b))
      (and (= (cadr a) (cadr b)) (by-name a b))))

(display (sort-by '(5 2 9 1 5 6) <)) (newline)
(display (sort-by '(5 2 9 1 5 6) >)) (newline)
(display (sort-by people by-age)) (newline)
(display (sort-by people by-name)) (newline)
(display (sort-by people by-age-desc-then-name)) (newline)
