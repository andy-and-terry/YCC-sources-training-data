;; The composite pattern lets leaves and containers be treated
;; uniformly: both a file and a directory understand `total-size`.

(define-record-type file-leaf
  (make-file-leaf name size)
  file-leaf?
  (name file-leaf-name)
  (size file-leaf-size))

(define-record-type directory
  (make-directory-raw name children)
  directory?
  (name directory-name)
  (children directory-children set-directory-children!))

(define (make-directory name) (make-directory-raw name '()))

(define (directory-add! dir child)
  (set-directory-children! dir (append (directory-children dir) (list child))))

(define (total-size node)
  (cond ((file-leaf? node) (file-leaf-size node))
        ((directory? node) (apply + (map total-size (directory-children node))))
        (else (error "unknown node type"))))

(define root (make-directory "root"))
(directory-add! root (make-file-leaf "a.txt" 10))

(define sub (make-directory "sub"))
(directory-add! sub (make-file-leaf "b.txt" 20))
(directory-add! sub (make-file-leaf "c.txt" 5))
(directory-add! root sub)

(display "total size: ") (display (total-size root)) (display " KB") (newline)
