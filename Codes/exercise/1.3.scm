#lang sicp

(define leq
  (lambda (a b)
    (not (> a b))))

; define functions
(define (square x) (* x x))
(define (sum-of-squares x y)
        (+ (square x) (square y)))

(define sum-square-of-two-larger
  (lambda (a b c)
    (if (leq a b)
        (if (leq a c)
            (sum-of-squares b c)
            (sum-of-squares a b))
        (if (leq b c)
            (sum-of-squares a c)
            (sum-of-squares a b)))))

(sum-square-of-two-larger 1 3 5)
(sum-square-of-two-larger 3 1 5)
(sum-square-of-two-larger 5 3 1)
(sum-square-of-two-larger 1 5 3)