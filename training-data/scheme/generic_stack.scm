(define (make-stack) (list '()))

(define (stack-push! s item)
  (set-car! s (cons item (car s))))

(define (stack-pop! s)
  (let ((top (car (car s))))
    (set-car! s (cdr (car s)))
    top))

(define s (make-stack))
(stack-push! s 1)
(stack-push! s 2)
(stack-push! s 3)
(display (stack-pop! s))
(newline)
(display (stack-pop! s))
(newline)
