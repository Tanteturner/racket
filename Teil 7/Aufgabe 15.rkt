;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ---- Hilfsfunktion ----

;; only-positive-or-zero gibt für einen positiven wert den wert zurück, für alles andere 0
;; zahl -> zahl

;; Tests
(check-expect (only-positive-or-zero 0) 0)
(check-expect (only-positive-or-zero -10) 0)
(check-expect (only-positive-or-zero 10) 10)

(define only-positive-or-zero
  (lambda [value]
    (cond
      [(positive? value) value]
      [else 0])))





;; ---- Aufgabe ----

(define monatliche-sollarbeitszeit 160)


;; festangestellter ist ein datentyp, der einen festangestellten Mitarbeiter darstellt
;; ein festangesteller ist definiert, durch seinen namen, sein grundgehalt und seine arbeitszeit im letzen Monat in Stunden
(define-struct festangestellter [name grundgehalt monatliche-arbeitsstunden])


;; festangestellter ist ein datentyp, der einen festangestellten Mitarbeiter darstellt
;; ein festangesteller ist definiert, durch seinen namen, seinen Stundenlohn und seine arbeitszeit im letzen Monat in Stunden
(define-struct werkstudent [name stundenlohn monatliche-arbeitsstunden])


;; bruttolohn-werkstudent errechnet den bruttolohn eines werkstudenten
;; werkstudent -> zahl

;; Test:
(check-expect (bruttolohn-werkstudent (make-werkstudent "Peter" 10 20)) 200)

(define bruttolohn-werkstudent
  (lambda [werki]
    (*
     (werkstudent-stundenlohn werki)
     (werkstudent-monatliche-arbeitsstunden werki))))


;; überstunden-festangestellter errechnet die überstunden eines festangestellten
;; festangestellter -> zahl

;; Test:
(check-expect (überstunden-festangestellter (make-festangestellter "Peter" 3000 100)) 0)
(check-expect (überstunden-festangestellter (make-festangestellter "Peter" 3000 160)) 0)
(check-expect (überstunden-festangestellter (make-festangestellter "Peter" 3000 170)) 10)

(define überstunden-festangestellter
  (lambda [angestellter]
    (only-positive-or-zero
     (- (festangestellter-monatliche-arbeitsstunden angestellter) monatliche-sollarbeitszeit))))


;; überstundenlohn-festangestellter berechnet den Lohn, den ein festangesteller für überstunden erhält
;; festangestellter -> zahl

;; Tests
(check-expect (überstundenlohn-festangestellter (make-festangestellter "Peter" 3000 100)) 23.4375)
(check-expect (überstundenlohn-festangestellter (make-festangestellter "Peter" 2000 100)) 15.625)

(define überstundenlohn-festangestellter
  (lambda [angestellter]
    ( * 1.25
        (/
         (festangestellter-grundgehalt angestellter)
         monatliche-sollarbeitszeit))))


;; bruttolohn-festangestellter errechnet den bruttolohn eines festangestellten
;; festangestellter -> zahl

;; Test:
(check-expect (bruttolohn-festangestellter (make-festangestellter "Peter" 3000 100)) 3000)
(check-expect (bruttolohn-festangestellter (make-festangestellter "Peter" 3000 160)) 3000)
(check-expect (bruttolohn-festangestellter (make-festangestellter "Peter" 3000 176)) 3375)

(define bruttolohn-festangestellter
  (lambda [angestellter]
    (+ (festangestellter-grundgehalt angestellter)
       (* (überstunden-festangestellter angestellter) (überstundenlohn-festangestellter angestellter)))))



;; Ein mitarbeiter ist entweder
;; - festangesteller
;; - werkstudent




;; ---- Hauptfunktion ----

;; bruttolohn-mitarbeiter berechnet die bruttolohn eines Mitarbeiters
;; mitarbeiter -> zahl

;; Tests
(check-expect (bruttolohn-mitarbeiter (make-festangestellter "Peter" 3000 100)) 3000)
(check-expect (bruttolohn-mitarbeiter (make-festangestellter "Peter" 3000 160)) 3000)
(check-expect (bruttolohn-mitarbeiter (make-festangestellter "Peter" 3000 176)) 3375)
(check-expect (bruttolohn-mitarbeiter (make-werkstudent "Peter" 10 20)) 200)

(define bruttolohn-mitarbeiter
  (lambda [mitarbeiter]
    (cond
      [(werkstudent? mitarbeiter) (bruttolohn-werkstudent mitarbeiter)]
      [(festangestellter? mitarbeiter) (bruttolohn-festangestellter mitarbeiter)])))


