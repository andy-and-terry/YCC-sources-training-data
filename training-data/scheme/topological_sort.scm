(define graph '((a . (b c)) (b . (d)) (c . (d)) (d . ())))

(define (visit node visited order)
  (if (member node visited)
      (cons visited order)
      (let* ((visited1 (cons node visited))
             (deps (cdr (assq node graph)))
             (result (fold-visit deps visited1 order)))
        (cons (car result) (append (cdr result) (list node))))))

(define (fold-visit nodes visited order)
  (if (null? nodes)
      (cons visited order)
      (let ((result (visit (car nodes) visited order)))
        (fold-visit (cdr nodes) (car result) (cdr result)))))

(define (topo-sort)
  (cdr (fold-visit '(a b c d) '() '())))

(display (topo-sort))
(newline)
