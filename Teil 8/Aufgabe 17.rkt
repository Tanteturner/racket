;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; lvz ist eine liste von Zahlen. Sie ist entweder:
;; - empty
;; - eine Zahl mit einer lvz


;; a) sum berechnet die summe aller zahlen aus einer lvz
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


;; b) prod berechnet das produkt aller zahlen aus einer lvz
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


;; c) maximum berechnet das maximun der zahlen aus einer lvz
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

;; d) enthält überprüft ob ein symbol in einer liste enthalten ist
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


;; e) declist gibt aus einer lvz eine lvz dessen elemente um 1 kleiner sind als die ursprungsliste
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



;; f)

;; eine gliste ist eine geschachtelte liste. Sie ist entweder
;; - empty
;; - ein Atom und eine gliste
;; - eine gliste und eine gliste

;; concatenate hängt zwei geschachtelte listen aneinander, also '(a b) '(c d) -> '(a b c d)
;;    gliste, gliste -> gliste 

;; Tests
(check-expect (concatenate '() '()) '())
(check-expect (concatenate '(a) '(b)) '(a b))
(check-expect (concatenate '(a b c) '(d e f)) '(a b c d e f))

(define concatenate
  (lambda [list-a list-b]
    (cond
      [(empty? list-a) list-b]
      [else (cons (first list-a) (concatenate (rest list-a) list-b))])))

;; flatten  gibt eine liste von allen Atomen zurück, die in der eingegeben liste vorkommen, unabhängig von ihrer verschachtelung
;; flatten: gliste -> gliste

;; Tests
(check-expect (flatten '()) '())
(check-expect (flatten '(A)) '(A))
(check-expect (flatten '(A (B C) D)) '(A B C D))
(check-expect (flatten '((A B C) (D E))) '(A B C D E))
(check-expect (flatten '(((A)))) '(A))

(define flatten
  (lambda [list]
    (cond
      [(empty? list) empty]
      [(list? (first list)) (concatenate (flatten (first list)) (flatten (rest list)))]
      [else (cons (first list) (flatten (rest list)))])))




;; g)

;; eine lva ist eine Liste von Atomen. Sie ist entweder:
;; - empty
;; - ein Atom und eine lva


;; remove-elements gibt eine lva zurück, welche der eingangsliste ohne alle vorkommen eines angegebenen atoms entspricht
;; remove-elements lva, atom -> lva
(define remove-elements
  (lambda [list atom]
    (cond
      [(empty? list) empty]
      [(equal? (first list) atom) (remove-elements (rest list) atom)]
      [else (cons (first list) (remove-elements (rest list) atom))])))


;; frequency-of gibt die häufigkeit einer atoms in einer lva zurück
;; frequency-of: lva, atom -> zahl

;; Tests
(check-expect (frequency-of '() 'a) 0)
(check-expect (frequency-of '(a) 'a) 1)
(check-expect (frequency-of '(b) 'a) 0)
(check-expect (frequency-of '(a b b c) 'b) 2)
(check-expect (frequency-of '(a b b c) 'x) 0)

(define frequency-of
  (lambda [list atom]
    (cond
      [(empty? list) 0]
      [(equal? (first list) atom) (+ 1 (frequency-of (rest list) atom))]
      [else (frequency-of (rest list) atom)])))


;; frequencies gibt die häufigkeiten der atome einer liste in paaren zurück (Atom Häufigkeit) z.B: (B 4)
;; frequencies: lva -> pair-list

;; Tests
(check-expect (frequencies '()) '())
(check-expect (frequencies '(A)) '((A 1)))
(check-expect (frequencies '(A B)) '((A 1) (B 1)))
(check-expect (frequencies '(A B A B A C A)) '((A 4) (B 2) (C 1)))

(define frequencies
  (lambda [list]
    (cond
      [(empty? list) empty]
      [else (cons
             (cons (first list) (cons (frequency-of list (first list)) empty))
             (frequencies
              (remove-elements (rest list) (first list))))])))


;; h)

;; anzahl-bevor-summe-erreicht lvz, zahl -> zahl

;; Tests
(check-error (anzahl-bevor-summe-erreicht '() 1) "anzahl-bevor-summe-erreicht: Summe der Listenelemente zu klein")
(check-error (anzahl-bevor-summe-erreicht '(1) 2) "anzahl-bevor-summe-erreicht: Summe der Listenelemente zu klein")
(check-error (anzahl-bevor-summe-erreicht '(1 4) 100) "anzahl-bevor-summe-erreicht: Summe der Listenelemente zu klein")


(check-expect (anzahl-bevor-summe-erreicht '(2) 1) 0)
(check-expect (anzahl-bevor-summe-erreicht '(2 5 7) 2) 0)
(check-expect (anzahl-bevor-summe-erreicht '(2 5 7) 8) 2)


(define anzahl-bevor-summe-erreicht
  (lambda [lvz summe]
    (cond
      [(empty? lvz) (error 'anzahl-bevor-summe-erreicht "Summe der Listenelemente zu klein")]
      [(>= (first lvz) summe) 0]
      [else (+ 1 (anzahl-bevor-summe-erreicht (rest lvz) (- summe (first lvz))))])))






  

