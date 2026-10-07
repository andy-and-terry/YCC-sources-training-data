#lang racket

(struct command (execute undo))

(define (make-light-commands light-box)
  (define on (command (lambda () (set-box! light-box 'on))
                       (lambda () (set-box! light-box 'off))))
  (define off (command (lambda () (set-box! light-box 'off))
                        (lambda () (set-box! light-box 'on))))
  (values on off))

(define light (box 'off))
(define-values (turn-on turn-off) (make-light-commands light))

(define history '())
(define (run! cmd)
  (set! history (cons cmd history))
  ((command-execute cmd)))
(define (undo-last!)
  (unless (null? history)
    ((command-undo (car history)))
    (set! history (cdr history))))

(run! turn-on)
(displayln (unbox light))
(run! turn-off)
(displayln (unbox light))
(undo-last!)
(displayln (unbox light))
