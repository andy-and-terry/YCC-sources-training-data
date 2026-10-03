;; Merge overlapping intervals: sort by start, then fold left, growing
;; the last kept interval whenever the next one overlaps it.

(define (insert-by-start iv lst)
  (cond ((null? lst) (list iv))
        ((<= (car iv) (car (car lst))) (cons iv lst))
        (else (cons (car lst) (insert-by-start iv (cdr lst))))))

(define (sort-intervals intervals)
  (fold-left (lambda (acc iv) (insert-by-start iv acc)) '() intervals))

(define (merge-intervals intervals)
  (let loop ((sorted (sort-intervals intervals)) (result '()))
    (cond ((null? sorted) (reverse result))
          ((null? result) (loop (cdr sorted) (list (car sorted))))
          (else
           (let* ((last (car result)) (current (car sorted))
                  (last-lo (car last)) (last-hi (cdr last))
                  (cur-lo (car current)) (cur-hi (cdr current)))
             (if (<= cur-lo last-hi)
                 (loop (cdr sorted) (cons (cons last-lo (max last-hi cur-hi)) (cdr result)))
                 (loop (cdr sorted) (cons current result))))))))

(display (merge-intervals '((1 . 3) (2 . 6) (8 . 10) (15 . 18))))
(newline)
