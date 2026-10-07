;; Observer pattern via closures: a "subject" closure holds a list of
;; observer callbacks and invokes all of them whenever its state changes.

(define (make-subject)
  (let ((observers '()) (state #f))
    (lambda (msg . args)
      (cond ((eq? msg 'subscribe) (set! observers (cons (car args) observers)))
            ((eq? msg 'set-state!)
             (set! state (car args))
             (for-each (lambda (obs) (obs state)) observers))
            ((eq? msg 'state) state)
            (else (error "unknown message" msg))))))

(define subject (make-subject))

(subject 'subscribe (lambda (s) (display "logger saw: ") (display s) (newline)))
(subject 'subscribe (lambda (s) (display "counter saw: ") (display s) (newline)))

(subject 'set-state! 42)
(subject 'set-state! 99)
