#lang racket

;; `sync` waits on the first ready event; `sync/timeout` bounds the wait.
(define ch1 (make-channel))
(define ch2 (make-channel))

(thread (lambda () (sleep 0.05) (channel-put ch1 'slow)))
(thread (lambda () (channel-put ch2 'fast)))

(displayln (sync ch1 ch2))

(displayln (sync/timeout 0.01 (make-channel)))   ; #f on timeout

(define result
  (sync (handle-evt ch1 (lambda (v) (list 'from-ch1 v)))
        (handle-evt (alarm-evt (+ (current-inexact-milliseconds) 500))
                    (lambda (_) 'timeout))))
(displayln result)
