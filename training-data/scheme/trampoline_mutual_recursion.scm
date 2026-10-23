;; Trampolining: return thunks instead of recursing so the stack stays flat.
(define (trampoline result)
  (if (procedure? result)
      (trampoline (result))
      result))

(define (my-even? n)
  (if (= n 0) #t (lambda () (my-odd? (- n 1)))))

(define (my-odd? n)
  (if (= n 0) #f (lambda () (my-even? (- n 1)))))

(display (trampoline (my-even? 10)))
(newline)
(display (trampoline (my-odd? 100001)))
(newline)
