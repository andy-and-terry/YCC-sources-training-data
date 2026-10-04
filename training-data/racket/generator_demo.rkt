#lang racket
(require racket/generator)

(define (naturals-from n)
  (generator ()
    (let loop ([i n])
      (yield i)
      (loop (add1 i)))))

(define g (naturals-from 5))
(displayln (list (g) (g) (g)))

(define (tree-walk tree)
  (generator ()
    (let walk ([t tree])
      (cond
        [(null? t) (void)]
        [(pair? t) (walk (car t)) (walk (cdr t))]
        [else (yield t)]))
    'done))

(define leaves (tree-walk '((1 2) (3 (4 5)) 6)))
(let loop ([v (leaves)] [acc '()])
  (if (eq? v 'done)
      (displayln (reverse acc))
      (loop (leaves) (cons v acc))))

(displayln (for/list ([x (in-generator (for ([i 4]) (yield (* i i))))]) x))

(define echo
  (generator (first)
    (let loop ([prev first])
      (loop (yield (list 'got prev))))))
(displayln (echo 'a))
(displayln (echo 'b))
(displayln (generator-state echo))
