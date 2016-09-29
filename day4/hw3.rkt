#lang racket

;;; Student Name: Nur Shlapobersky
;;;
;;; Check one:
;;; [x] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define operator-list
    (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not)))

(define (assq key lst)
    (cond [(null? lst)                      #f]
          [(eq? key (first (first lst)))    (first lst)]
          [else                             (assq key (rest lst))]
    )
)



(write (assq 'ADD operator-list)) (newline) ;--> '(ADD #<procedure:+>)
(write (assq 'ANND operator-list)) (newline) ;--> '(ANND #<procedure>)
(write (assq 'NOTT operator-list)) (newline) ;--> '(NOTT #<procedure:not>)
(write (assq 'FOO operator-list))  (newline) ;--> #f




;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (assq-calc key lst)
    (cond [(null? lst)                      #f]
          [(eq? key (first (first lst)))    (second (first lst))]
          [else                             (assq-calc key (rest lst))]
    )
)

(define (interpret op a b)
    (cond ((eq? op 'ADD)    (+ a b))
          ((eq? op 'SUB)    (- a b))
          ((eq? op 'MUL)    (* a b))
          ((eq? op 'DIV)    (/ a b))
          ((eq? op 'GT)     (> a b))
          ((eq? op 'LT)     (< a b))
          ((eq? op 'GE)     (<= a b))
          ((eq? op 'LE)     (>= a b))
          ((eq? op 'EQ)     (not (equal? a b)))
          ((eq? op 'NEQ)    (not (equal? a b)))
          ((eq? op 'AND)    (and a b))
          ((eq? op 'OR)     (or a b))
    )
)

(define lookup
    (list
        (list 'a 3)
        (list 'b 4)
        (list 'c 5)))

;(write (assq-calc 'd lookup)) (newline)

(define (calculate x)
    (write x) (newline)
    (cond
        [(number? (assq-calc x lookup)) (assq-calc x lookup)]
        [(eq? 'NOT (first x))
            (if (boolean? (second x))
                (not (second x))
                (not (calculate (second x)))
            )]
        [(eq? 'IPH (first x))
            (cond
                [(eq? #t (calculate (second x)))       (calculate (third x))]
                [(eq? #f (calculate (second x)))       (calculate (fourth x))])]
        [else
            (interpret (first x)
                (if (or (number? (second x)) (boolean? (second x)))
                    (second x)
                    (calculate (second x)))
                (if (or (number? (third x)) (boolean? (third x)))
                    (third x)
                    (calculate (third x)))
            )]
    )
)

(write (calculate '(ADD b a))) (newline)