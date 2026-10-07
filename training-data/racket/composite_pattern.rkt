#lang racket

(struct file-node (name size))
(struct dir-node (name children))

(define (total-size node)
  (cond
    [(file-node? node) (file-node-size node)]
    [(dir-node? node) (apply + (map total-size (dir-node-children node)))]))

(define (print-tree node [depth 0])
  (define indent (make-string (* depth 2) #\space))
  (cond
    [(file-node? node)
     (printf "~a~a (~a bytes)\n" indent (file-node-name node) (file-node-size node))]
    [(dir-node? node)
     (printf "~a~a/\n" indent (dir-node-name node))
     (for ([child (dir-node-children node)]) (print-tree child (add1 depth)))]))

(define tree
  (dir-node "root"
            (list (file-node "a.txt" 100)
                  (dir-node "src" (list (file-node "main.rkt" 250) (file-node "lib.rkt" 400))))))

(print-tree tree)
(printf "total size: ~a\n" (total-size tree))
