;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; lvs ist eine liste von symbolen

;; a) concatenate hängt zwei listen von symbolen aneinander, also '(a b) '(c d) -> '(a b c d)
;;    lvs, lvs -> lvs 

;; Tests
(check-expect (concatenate '() '()) '())
(check-expect (concatenate '(a) '(b)) '(a b))
(check-expect (concatenate '(a b c) '(d e f)) '(a b c d e f))

(define concatenate
  (lambda [list-a list-b]
    (cond
      [(empty? list-a) list-b]
      [else (cons (first list-a) (concatenate (rest list-a) list-b))])))

;; lvz ist eine Liste von zahlen. Sie ist entweder:
;; - empty
;; - eine Zahl mit einer lvz

;; b) mult-2-lvz gibt eine lvz zurück, die als elemente die produkte der jeweiligen elemente zweier gleichlanger lvz enthält
;;    lvz, lvz -> lvz

;; Tests
(check-expect (mult-2-lvz '() '()) '())
(check-expect (mult-2-lvz '(1) '(2)) '(2))
(check-expect (mult-2-lvz '(1 3) '(2 4)) '(2 12))

(define mult-2-lvz
  (lambda [list-a list-b]
    (cond
      [(empty? list-a) empty]
      [else
       (cons
        (*(first list-a) (first list-b))
        (mult-2-lvz (rest list-a) (rest list-b)))])))

;; c) merge nimmt zwei sortierte lvz an und gibt eine Liste aller Zahlen der Eingabelisten in sortierter Reihenfolge zurück
;; merge: lvz, lvz -> lvz

;; Tests:
(check-expect (merge '() '()) '())
(check-expect (merge '(1) '()) '(1))
(check-expect (merge '() '(1)) '(1))
(check-expect (merge '(1 2 4 6) '(1 3 5)) '(1 1 2 3 4 5 6))

(define merge
  (lambda [list-a list-b]
    (cond
      [(and (empty? list-a) (empty? list-b)) empty]
      [(and (cons? list-a) (empty? list-b)) list-a]
      [(and (empty? list-a) (cons? list-b)) list-b]
      [else
       (cond
         [(< (first list-a) (first list-b))
          (cons (first list-a) (merge (rest list-a) list-b))]
         [else
          (cons (first list-b) (merge list-a (rest list-b)))])])))

