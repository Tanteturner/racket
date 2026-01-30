;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; lvz ist eine liste von Zahlen


;; sum berechnet die summe aller zahlen aus einer lvz
;; lvz -> zahl

;; Tests
(check-expect (sum '()) 0)
(check-expect (sum (cons 2 '())) 2)
(check-expect (sum (cons 1 (cons 3 '()))) 4)

(define sum
  (lambda [lvz]
    (cond
      [(empty? lvz) 0]
      [else (+ (first lvz) (sum (rest lvz)))])))


;; prod berechnet das produkt aller zahlen aus einer lvz
;; lvz -> zahl

;; Tests
(check-expect (prod '()) 1)
(check-expect (prod (cons 2 '())) 2)
(check-expect (prod (cons 1 (cons 3 '()))) 3)

(define prod
  (lambda [lvz]
    (cond
      [(empty? lvz) 1]
      [else (* (first lvz) (prod (rest lvz)))])))


;; maximum berechnet das maximun der zahlen aus einer lvz
;; lvz -> zahl

;; Tests
(check-range (maximum '()) -inf.0 0.0001)
(check-expect (maximum (cons 2 '())) 2)
(check-expect (maximum (cons 5 (cons 3 '()))) 5)
(check-expect (maximum (cons 1 (cons 4 '()))) 4)

(define maximum
  (lambda [lvz]
    (cond
      [(empty? lvz) -inf.0]
      [else (cond
              [(< (first lvz) (maximum (rest lvz))) (maximum (rest lvz))]
              [else (first lvz)])])))


;; lvs ist eine liste von Symbolen

;; enthält überprüft ob ein symbol in einer liste enthalten ist
;; symbol, lvs -> boolean

;; Tests
(check-expect (enthält? 'test '()) #false)
(check-expect (enthält? 'test2 (cons 'test '())) #false)
(check-expect (enthält? 'test (cons 'test '())) #true)
(check-expect (enthält? 'test (cons 'test1 (cons 'test2 '()))) #false)
(check-expect (enthält? 'test2 (cons 'test1 (cons 'test2 '()))) #true)

(define enthält?
  (lambda [symbol lvs]
    (cond
      [(empty? lvs) #false]
      [(equal? symbol (first lvs)) #true]
      [else (enthält? symbol (rest lvs))])))


;; declist gibt aus einer lvz eine lvz dessen elemente um 1 kleiner sind als die ursprungsliste
;; lvz -> lvz

;; Tests
(check-expect (declist '()) empty)
(check-expect (declist (cons 2 '())) (cons 1 '()))
(check-expect (declist (cons 5 (cons 3 '()))) (cons 4 (cons 2 '())))

(define declist
  (lambda [lvz]
    (cond
      [(empty? lvz) empty]
      [else (cons
             (- (first lvz) 1)
             (declist (rest lvz)))])))

