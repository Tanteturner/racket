;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; lvs ist eine liste von symbolen

;; a) concatenate hängt zwei listen von symbolen aneinander, also '(a b) '(c d) -> '(a b c d)
;;    lvs, lvs -> lvs 

;; Tests
(check-expect (concatenate '() '()) '())
(check-expect (concatenate (cons 'a '()) (cons 'b '())) (cons 'b (cons 'a '())))
(check-expect (concatenate (cons 'a (cons 'b '())) (cons 'c (cons 'd '()))) (cons 'd (cons 'c (cons 'a (cons 'b '())))))

(define concatenate
  (lambda [list-a list-b]
    (cond
      [(empty? list-b) list-a]
      [else (concatenate
             (cons (first list-b) list-a)
             (rest list-b))])))

;; b) mult-2-lvz gibt eine lvz zurück, die als elemente die produkte der jeweiligen elemente zweier gleichlanger lvz enthält
;;    lvz, lvz -> lvz

;; Tests
(check-expect (mult-2-lvz '() '()) '())
(check-expect (mult-2-lvz (list 1) (list 2)) (list 2))
(check-expect (mult-2-lvz (list 1 3) (list 2 4)) (list 2 12))

(define mult-2-lvz
  (lambda [list-a list-b]
    (cond
      [(or (empty? list-a) (empty? list-b)) empty]
      [else
       (cons
        (*(first list-a) (first list-b))
        (mult-2-lvz (rest list-a) (rest list-b)))])))

;; c) 