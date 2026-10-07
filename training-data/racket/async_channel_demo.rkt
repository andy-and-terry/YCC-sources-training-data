#lang racket
(require racket/async-channel)

;; A bounded async channel: put blocks when the buffer is full.
(define ch (make-async-channel 2))

(define producer
  (thread (lambda ()
            (for ([i 5]) (async-channel-put ch i))
            (async-channel-put ch 'done))))

(let loop ([acc '()])
  (define v (async-channel-get ch))
  (if (eq? v 'done)
      (displayln (reverse acc))
      (loop (cons v acc))))

(thread-wait producer)
(displayln (async-channel-try-get ch))
