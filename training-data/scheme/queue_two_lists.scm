;; Functional queue: a front list and a reversed back list give amortized O(1).

(define (make-queue) (cons '() '()))

(define (enqueue q x)
  (cons (car q) (cons x (cdr q))))

(define (queue-empty? q)
  (and (null? (car q)) (null? (cdr q))))

(define (dequeue q)
  ;; returns (value . new-queue)
  (cond ((pair? (car q))
         (cons (caar q) (cons (cdar q) (cdr q))))
        ((null? (cdr q)) (error "empty queue"))
        (else (dequeue (cons (reverse (cdr q)) '())))))

(define q (enqueue (enqueue (enqueue (make-queue) 'a) 'b) 'c))

(define (drain q)
  (if (queue-empty? q)
      '()
      (let ((r (dequeue q)))
        (cons (car r) (drain (cdr r))))))

(display (drain q))
(newline)
