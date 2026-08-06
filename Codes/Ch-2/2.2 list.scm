#lang sicp

(define 1-to-4 (list 1 2 3 4))

1-to-4

(car (cdr 1-to-4))

(cons 5 1-to-4)

; 终止条件，items 列表为空
; 否则对第一个元素进行 map 操作，并与后续元素进行拼接
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(map abs (list -10 2.5 -11.6 17))

(map (lambda (x) (* x x)) (list 1 2 3 4))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(scale-list 1-to-4 10)
