#lang racket

;;; Student Name: Nur Shlapobersky
;;;
;;; Check one:
;;; ( ) I completed this assignment without assistance or external resources.
;;; (x) I completed this assignment with assistance from talking to a few people
;;;     and/or using these external resources: ___ I redid my calculator function
;;;     after talking with Byron a bit, so that it wouldn't be as messy

(define (assq key lst)
    (cond [(null? lst)                      #f]
          [(eq? key (first (first lst)))    (second (first lst))]
          [else                             (assq key (rest lst))]
    )
)

;;; my-append function, for use in the DEFINE evaluation

(define (my-append-help lst acc)
  (if (null? lst)
      acc
      (my-append-help (rest lst) (cons (first lst) acc))
  )
)

(define (my-append lst other)
    (my-append-help (reverse lst) other))

;;; Calculator/evaluator functions from previous homeworks

;(define (calculate x lookup)
;  (cond ((number? (assq x lookup)) (assq x lookup))
;        ((number? x)                x)
;        ((boolean? x)               x)
;        ((eq? (first x) 'IPH)       (if (calculate (second x) lookup) (third x) (fourth x)))
;        ((eq? (first x) 'NOT)       (not (second x)))
;        ((eq? (first x) 'DEFINE)    (repl (my-append lookup (list (list (second x) (calculate (third x) lookup))))))
;        ((eq? (first x) 'LAMBDA)    (list 'lambda (second x) (third x) lookup))
;        ;((eq? (first x  'EXIT))     (exit))
;        (else ((cond
;            ((eq? (first x) 'ADD)       +)
;            ((eq? (first x) 'SUB)       -)
;            ((eq? (first x) 'MUL)       *)
;            ((eq? (first x) 'GT)        >)
;            ((eq? (first x) 'LT)        <)
;            ((eq? (first x) 'GE)        >=)
;            ((eq? (first x) 'LE)        <=)
;            ((eq? (first x) 'EQ)        =)
;            ((eq? (first x) 'NEQ)       (lambda (x y) (not (= x y))))
;            ((eq? (first x) 'AND)       (lambda (x y) (and x y)))
;            ((eq? (first x) 'OR)        (lambda (x y) (or x y)))
;            (else                       (error "Can't do " (first x)))
;                )
;        (calculate (second x) lookup) (calculate (third x) lookup)))
;    )
;)


(define (calculate x env)
    (cond ((number? x)                x)
          ((boolean? x)               x)
          ((symbol? x)                (assq x env))
          ((list? x)
            (cond
              ((eq? (first x) 'IPH)       (if (calculate (second x) env) (third x) (fourth x)))
              ((eq? (first x) 'NOT)       (not (second x)))
              ((eq? (first x) 'DEFINE)    (repl (my-append env (list (list (second x) (calculate (third x) env))))))
              ((eq? (first x) 'LAMBDA)    (list 'lambda (second x) (third x) env))
              (else ((assq (first x) env) (calculate (second x) env) (calculate (third x) env)))
            )
          )
    )
)

(define (apply-proc proc env)
    (calculate (third proc) (my-append env ((map list  (second proc) (list (calculate (fourth proc)) (calculate (fifth proc)))))))
    )


;;; REPL code

;(define lookup
;    (list
;        (list 'a 3)
;        (list 'b 4)
;        (list 'c 5)))

(define env-list
    (list
        (list 'ADD  +)
        (list 'SUB  -)
        (list 'MUL  *)
        (list 'GT   >)
        (list 'LT   <)
        (list 'GE   >=)
        (list 'LE   <=)
        (list 'EQ   =)
        (list 'NEQ  (lambda (x y) (not (= x y))))
        (list 'AND  (lambda (x y) (and x y)))
        (list 'OR   (lambda (x y) (or x y)))
        (list 'a    3)
        (list 'b    4)
        (list 'c    5)
    )
)


(define (run-repl env)
  (display "welcome to my repl.  type some scheme-ish")
  (repl env))

(define (repl env)
  (display "> ")
  (display (calculate (read) env))
  (newline)
  (repl env))


(run-repl env-list)

