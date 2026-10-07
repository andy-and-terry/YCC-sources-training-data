;; Singleton via a closure that memoizes the one instance it ever
;; creates, returned through set!-ing a variable captured by closure.

(define make-app-config
  (let ((instance #f))
    (lambda ()
      (if (not instance)
          (set! instance (let ((settings '()))
                            (lambda (msg . args)
                              (cond ((eq? msg 'set!) (set! settings (cons (cons (car args) (cadr args))
                                                                           (filter (lambda (e) (not (eq? (car e) (car args)))) settings))))
                                    ((eq? msg 'get) (let ((e (assq (car args) settings))) (if e (cdr e) #f)))
                                    (else (error "unknown message" msg)))))))
      instance)))

(define a (make-app-config))
(define b (make-app-config))

(a 'set! 'theme "dark")
(display (b 'get 'theme))
(newline)
(display (eq? a b))
(newline)
