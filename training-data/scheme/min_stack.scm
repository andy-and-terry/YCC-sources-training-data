;; A stack that also tracks its running minimum in O(1), via a second
;; stack of minimums recorded alongside each push.

(define (make-min-stack) (cons '() '())) ; (stack . min-stack)

(define (min-stack-push stack value)
  (let* ((items (car stack))
         (mins (cdr stack))
         (current-min (if (null? mins) value (min value (car mins)))))
    (set-car! stack (cons value items))
    (set-cdr! stack (cons current-min mins))))

(define (min-stack-pop! stack)
  (set-car! stack (cdr (car stack)))
  (set-cdr! stack (cdr (cdr stack))))

(define (min-stack-min stack) (car (cdr stack)))

(define s (make-min-stack))
(min-stack-push s 5)
(min-stack-push s 2)
(min-stack-push s 7)
(display (min-stack-min s)) (newline) ; 2
(min-stack-pop! s)
(display (min-stack-min s)) (newline) ; 2
(min-stack-pop! s)
(display (min-stack-min s)) (newline) ; 5
