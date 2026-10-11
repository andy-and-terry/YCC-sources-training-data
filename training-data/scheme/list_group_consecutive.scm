;; Grouping consecutive equal elements and counting them.

(define (group-consecutive lst)
  (if (null? lst)
      '()
      (let loop ((rest (cdr lst)) (cur (list (car lst))) (acc '()))
        (cond ((null? rest) (reverse (cons cur acc)))
              ((equal? (car rest) (car cur))
               (loop (cdr rest) (cons (car rest) cur) acc))
              (else (loop (cdr rest) (list (car rest)) (cons cur acc)))))))

(define (count-runs lst)
  (map (lambda (g) (cons (car g) (length g))) (group-consecutive lst)))

(display (group-consecutive '(a a b c c c a))) (newline)
(display (count-runs '(a a b c c c a))) (newline)
(display (count-runs '())) (newline)
(display (count-runs (string->list "aaabccdddd"))) (newline)
