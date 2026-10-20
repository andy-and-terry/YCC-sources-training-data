#lang racket
(define (find-first pred lst)
  (let/ec return
    (for ([x lst]) (when (pred x) (return x)))
    #f))
(displayln (find-first even? '(1 3 6 7)))
(displayln (call/cc (λ (k) (+ 1 (k 42)))))
(displayln (+ 1 (call-with-composable-continuation (λ (k) (abort-current-continuation (default-continuation-prompt-tag) (λ () 0))) )))
(define tag (make-continuation-prompt-tag))
(displayln (call-with-continuation-prompt (λ () (+ 1 (abort-current-continuation tag (λ () 'aborted)))) tag (λ (th) (th))))
(displayln (with-handlers ([string? values]) (raise "caught string")))
(displayln (dynamic-wind (λ () (display "[in]")) (λ () 'result) (λ () (display "[out]"))))
