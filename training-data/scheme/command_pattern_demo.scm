;; Command pattern: each command is a pair of closures (execute . undo)
;; captured over the same mutable light cell, pushed onto a history
;; stack so the last command can be undone generically.

(define (make-light) (list #f))
(define (light-on? light) (car light))
(define (light-set! light value) (set-car! light value))

(define (turn-on-command light)
  (cons (lambda () (light-set! light #t))
        (lambda () (light-set! light #f))))

(define (turn-off-command light)
  (cons (lambda () (light-set! light #f))
        (lambda () (light-set! light #t))))

(define (make-remote) (list '()))
(define (press-button! remote command)
  ((car command))
  (set-car! remote (cons command (car remote))))
(define (press-undo! remote)
  (let ((history (car remote)))
    (unless (null? history)
      ((cdr (car history)))
      (set-car! remote (cdr history)))))

(define light (make-light))
(define remote (make-remote))

(press-button! remote (turn-on-command light))
(display (light-on? light))
(newline)
(press-undo! remote)
(display (light-on? light))
(newline)
