#lang sicp

; 这里定义了一个过程，叫做 (cons a b)，参数为 (pick)
; 若 pick == 1，返回 a; 否则，返回 b

(define (cons a b)
  (lambda (pick)
    (cond ((= pick 1) a)
          ((= pick 2) b))))

(define (car x) (x 1))
(define (cdr x) (x 2))

; (define p (cons 3 5))
; p = (lambda (pick) (cond ((= pick 1) 3) ((= pick 2) 5)))
(define p (cons 3 5))  ; 在这里， p 即是过程，也是对象
(car p)
(cdr p)