;; A generator built from call/cc: each call to the returned closure
;; resumes the generator's body from where it last yielded. This is a
;; different use of call/cc from the early-return search in
;; call_cc_demo.scm.

(define (make-generator proc)
  (define return #f)
  (define resume #f)
  (define (yield value)
    (call-with-current-continuation
     (lambda (k)
       (set! resume k)
       (return value))))
  (lambda ()
    (call-with-current-continuation
     (lambda (k)
       (set! return k)
       (if resume
           (resume #f)
           (begin
             (proc yield)
             (return 'done)))))))

(define counter
  (make-generator
   (lambda (yield)
     (yield 1)
     (yield 2)
     (yield 3))))

(display (counter))
(newline)
(display (counter))
(newline)
(display (counter))
(newline)
(display (counter))
(newline)
