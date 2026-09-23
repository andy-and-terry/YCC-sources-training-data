#lang racket

;; The memento pattern captures an object's internal state so it can
;; be restored later, without exposing that state's representation.
;; A struct makes a fine opaque memento.

(struct memento (state))

(define (make-editor) (box ""))

(define (editor-type! editor text)
  (set-box! editor (string-append (unbox editor) text)))

(define (editor-save editor)
  (memento (unbox editor)))

(define (editor-restore! editor a-memento)
  (set-box! editor (memento-state a-memento)))

(define editor (make-editor))
(editor-type! editor "Hello")
(define checkpoint (editor-save editor))
(editor-type! editor ", world!")
(printf "before undo: ~a\n" (unbox editor))

(editor-restore! editor checkpoint)
(printf "after undo: ~a\n" (unbox editor))
