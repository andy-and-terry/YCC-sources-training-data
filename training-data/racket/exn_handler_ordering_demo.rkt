#lang racket

(struct my-error exn:fail (code))

(define (risky n)
  (cond [(= n 0) (raise (my-error "custom failure" (current-continuation-marks) 7))]
        [(= n 1) (error 'risky "plain error ~a" n)]
        [(= n 2) (/ 1 0)]
        [(= n 3) (raise 'a-symbol)]
        [else n]))

(for ([i (in-range 5)])
  (displayln
   (with-handlers ([my-error? (lambda (e) (list 'my-error (my-error-code e)))]
                   [exn:fail:contract:divide-by-zero? (lambda (e) 'div0)]
                   [exn:fail? (lambda (e) (list 'fail (exn-message e)))]
                   [symbol? (lambda (s) (list 'raised s))])
     (risky i))))

(displayln (with-handlers ([void (lambda (e) 'caught-anything)]) (raise 42)))
(displayln (exn? (with-handlers ([exn? values]) (vector-ref (vector 1) 5))))
