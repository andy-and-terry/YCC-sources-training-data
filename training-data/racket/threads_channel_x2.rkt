#lang racket
(define ch (make-channel))
(thread (λ () (for ([i 3]) (channel-put ch i))))
(displayln (for/list ([_ 3]) (channel-get ch)))
