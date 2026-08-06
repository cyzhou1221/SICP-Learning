#lang sicp


(define (make-rat-nosign n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (make-rat n d)
  (if (< n 0)
      (if (< d 0)
          (make-rat-nosign (- n) (- d)) ; n < 0, d < 0
          (make-rat-nosign n d))        ; n < 0, d > 0
      (if (< d 0)
          (make-rat-nosign (- n) (- d)) ; n > 0, d < 0
          (make-rat-nosign n d))))      ; n > 0, d > 0

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))

(car x)
(cdr x)

(car (car z))  ; 1
(car (cdr z))  ; 3

(print-rat (add-rat x y))
(print-rat (sub-rat x y))
(print-rat (mul-rat x y))

(define h (make-rat 2 -3))
(newline)
(car h)
(cdr h)