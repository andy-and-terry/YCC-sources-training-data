;; A double-ended queue backed by two lists, a front stack and a back
;; stack, allowing push/pop at either end.

(define (make-deque) (cons '() '()))

(define (deque-front lst) (car lst))
(define (deque-back lst) (cdr lst))

(define (deque-push-front dq x) (cons (cons x (deque-front dq)) (deque-back dq)))
(define (deque-push-back dq x) (cons (deque-front dq) (cons x (deque-back dq))))

(define (deque-rebalance dq)
  (cond
    ((and (null? (deque-front dq)) (not (null? (deque-back dq))))
     (let ((reversed (reverse (deque-back dq))))
       (cons reversed '())))
    ((and (null? (deque-back dq)) (not (null? (deque-front dq))))
     (let ((reversed (reverse (deque-front dq))))
       (cons '() reversed)))
    (else dq)))

(define (deque-pop-front dq)
  (let ((balanced (deque-rebalance dq)))
    (values (car (deque-front balanced))
            (cons (cdr (deque-front balanced)) (deque-back balanced)))))

(define (deque-pop-back dq)
  (let ((balanced (deque-rebalance dq)))
    (values (car (deque-back balanced))
            (cons (deque-front balanced) (cdr (deque-back balanced))))))

(define d1 (deque-push-back (deque-push-front (make-deque) 2) 3))
(define d2 (deque-push-front d1 1))

(call-with-values
 (lambda () (deque-pop-front d2))
 (lambda (front rest)
   (display front)
   (newline)
   (call-with-values
    (lambda () (deque-pop-back rest))
    (lambda (back _)
      (display back)
      (newline)))))
