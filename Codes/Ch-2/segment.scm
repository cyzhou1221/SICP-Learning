#lang sicp

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))

; representing vectors in the plane
(define (make-vector x y) (cons x y))

(define (xcor p) (car p))
(define (ycor p) (cdr p))

; representing line segments
(define (make-seg p q) (cons p q))

(define (seg-start s) (car s))
(define (seg-end s) (cdr s))

(define (mid-point s)
  (let ((a (seg-start s))
        (b (seg-end s)))
    (make-vector
     (average (xcor a) (xcor b))
     (average (ycor a) (ycor b)))))

(define (length s)
  (let ((dx (- (xcor (seg-start s)) (xcor (seg-end s))))
        (dy (- (ycor (seg-start s)) (ycor (seg-end s)))))
       (sqrt (+ (square dx)
                (square dy)))))


(define p1 (make-vector 1 2))
(define p2 (make-vector 3 4))
(define seg1 (make-seg p1 p2))
(define seg1-mid (mid-point seg1))
seg1
(seg-start seg1)
(seg-end seg1)
seg1-mid
(length seg1)