#lang racket

;;; Student Name: Frankly Olin [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from Byron (finding a typo in #4)
;;;     and/or using these external resources: Racket Documentation

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.

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

(define (calculate x)
    (cond
        [(eq? 'NOT (first x))
            (if (boolean? (first (rest x)))
                (not (first (rest x)))
                (not (calculate (first (rest x))))
            )]
        [(eq? 'IPH (first x))
            (cond
                [(eq? #t (calculate (first (rest x))))
                    (calculate (first (rest (rest x))))]
                [(eq? #f (calculate(first (rest x))))
                    (calculate (first (rest (rest (rest x)))))])]
        [else
            (interpret (first x)
                (if (or (number? (first (rest x))) (boolean? (first (rest x))))
                    (first (rest x))
                    (calculate (first (rest x))))
                (if (or (number? (first (rest (rest x)))) (boolean? (first (rest (rest x)))))
                    (first (rest (rest x)))
                    (calculate (first (rest (rest x)))))
            )]
    )
)

(write (calculate '(ADD 3 4))) (newline) ;; --> 7

;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.


(write (calculate '(ADD 3 4))) (newline) ;; --> 7
(write (calculate '(ADD 3 (MUL 4 5)))) (newline) ;; --> 23   ;; what is the equivalent construction using list?
(write (calculate '(SUB (ADD 3 4) (MUL 5 6)))) (newline);; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

(write (calculate '(GT (ADD 3 4) (MUL 5 6)))) (newline) ;; --> #f
(write (calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) (newline) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT
(write (calculate  '(NOT (GT (ADD 3 4) (MUL 5 6))))) (newline) ;; --> #t
(write (calculate '(AND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) )) (newline) ;; --> #f

;;; 5. Add IPH

(write (calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3)))) (newline) ;; -> 4

