(define (quicksort items)
  (if (or (null? items) (null? (cdr items)))
      items
      (let* ((pivot (car items))
             (rest (cdr items))
             (smaller (filter (lambda (x) (< x pivot)) rest))
             (larger (filter (lambda (x) (>= x pivot)) rest)))
        (append (quicksort smaller) (list pivot) (quicksort larger)))))

(display (quicksort '(5 3 8 1 9 2)))
(newline)
