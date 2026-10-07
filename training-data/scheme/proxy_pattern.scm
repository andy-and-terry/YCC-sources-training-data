;; A proxy stands in for the real object, adding lazy loading here:
;; the underlying image is only loaded from disk on first display.

(define (make-real-image filename)
  (display "loading image from disk: ") (display filename) (newline)
  (lambda ()
    (display "displaying ") (display filename) (newline)))

(define (make-proxy-image filename)
  (let ((real-image #f))
    (lambda ()
      (if (not real-image)
          (set! real-image (make-real-image filename)))
      (real-image))))

(define image (make-proxy-image "photo.png"))
(display "proxy created, nothing loaded yet") (newline)
(image)
(image)
