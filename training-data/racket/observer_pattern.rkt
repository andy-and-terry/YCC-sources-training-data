#lang racket

(define (make-subject)
  (box '()))

(define (subscribe! subject callback)
  (set-box! subject (cons callback (unbox subject))))

(define (notify-all subject value)
  (for ([callback (unbox subject)])
    (callback value)))

(define sensor (make-subject))
(subscribe! sensor (lambda (t) (printf "Alert: temperature is now ~a\n" t)))
(subscribe! sensor (lambda (t) (when (> t 30) (printf "Warning: high temperature ~a\n" t))))

(notify-all sensor 25.5)
(notify-all sensor 32.0)
