#lang racket

(struct memento (content))

(define (make-editor) (box ""))
(define (editor-type! editor text) (set-box! editor (string-append (unbox editor) text)))
(define (editor-save editor) (memento (unbox editor)))
(define (editor-restore! editor m) (set-box! editor (memento-content m)))

(define editor (make-editor))
(define history (box '()))
(define (push-history! m) (set-box! history (cons m (unbox history))))
(define (pop-history!)
  (define m (car (unbox history)))
  (set-box! history (cdr (unbox history)))
  m)

(editor-type! editor "Hello")
(push-history! (editor-save editor))
(editor-type! editor ", world")
(push-history! (editor-save editor))
(editor-type! editor "!!!")

(displayln (unbox editor))
(editor-restore! editor (pop-history!))
(displayln (unbox editor))
(editor-restore! editor (pop-history!))
(displayln (unbox editor))
