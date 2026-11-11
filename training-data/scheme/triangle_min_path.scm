(define (minimum-total triangle)
  (define (step row below)
    (let loop ((row row) (below below) (out '()))
      (if (null? row)
          (reverse out)
          (loop (cdr row) (cdr below)
                (cons (+ (car row) (min (car below) (cadr below))) out)))))
  (let ((rows (reverse triangle)))
    (car (fold-left (lambda (below row) (step row below)) (car rows) (cdr rows)))))

(display (minimum-total '((2) (3 4) (6 5 7) (4 1 8 3)))) (newline) ; 11
