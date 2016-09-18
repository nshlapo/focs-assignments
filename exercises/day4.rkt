#lang racket

(define (list-length xs)
  (foldl + 0 (map (lambda (x) 1) xs)))

(write (list-length '(1 2 a 4 5))) (newline)

(define (count-evens xs)
  (list-length (filter even? xs)))

(write (count-evens '(1 2 3 4 5))) (newline)

(define (list-square xs)
    (map (lambda (x) (* x x)) xs))

(write (list-square '(1 2 3 4 5))) (newline)

(define (list-add1 xs)
  (map (lambda (x) (+ 1 x)) xs))

(write (list-add1 '(1 2 3 4 5))) (newline)

(define (list-add10 xs)
  (map (lambda (x) (+ 10 x)) xs))

(write (list-add10 '(1 2 3 4 5))) (newline)

(define (list-addn n xs)
  (map (lambda (x) (+ n x)) xs))

(write (list-addn 3 '(1 2 3 4 5))) (newline)

(define (filter-even xs)
  (filter even? xs))

(write (filter-even '(1 2 3 4 5))) (newline)

(define (filter-positive xs)
  (filter positive? xs))

(write (filter-positive '(-2 -1 0 1 2 3 4 5))) (newline)

(define (filter-gt n xs)
  (filter (lambda (x) (>= x n)) xs))

(write (filter-gt 3 '(1 2 3 4 5))) (newline)