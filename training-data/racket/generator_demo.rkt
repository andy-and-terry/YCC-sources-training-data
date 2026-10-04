#lang racket
(require racket/generator)

(define (naturals-from n)
  (generator ()
    (let loop ([i n])
      (yield i)
      (loop (add1 i)))))

(define g (naturals-from 10))
(displayln (list (g) (g) (g)))

(define tree-walker
  (generator (tree)
    (let walk ([t tree])
      (cond [(null? t) (void)]
            [(pair? t) (walk (car t)) (walk (cdr t))]
            [else (yield t)]))
    'done))

(displayln (for/list ([x (in-producer (generator () (for ([i 3]) (yield i)) #f) #f)]) x))
(displayln (tree-walker '((1 2) (3 (4)))))
(displayln (tree-walker))
