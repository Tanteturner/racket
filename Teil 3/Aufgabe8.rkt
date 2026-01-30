;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ------------- Hilfsfunktionen -------------

;; Berechnet den Umfang eines Kreises mit dem Radius r
(define kreis-umfang
  (lambda [r] (* pi 2 r)))

;; Beispielanwendungen
(= (kreis-umfang 5) #i31.41592653589793)
(= (kreis-umfang 2) #i12.566370614359172)



;; Berechnet die Fläche eines Kreises mit dem Radius r
(define kreis-fläche
  (lambda [r] (* pi r r)))

;; Beispielanwendungen
(= (kreis-fläche 5) #i78.53981633974483)
(= (kreis-fläche 17) #i907.9202768874503)



;; Berechnet die Oberfläche eines Kreisrings mit den Radien r1 und r2, wobei r2 der äußere Radius ist
(define kreisring-fläche
  (lambda [r1 r2]
    (- (kreis-fläche r2) (kreis-fläche r1))))

;; Beispielanwendungen
(= (kreisring-fläche 1 2) #i9.42477796076938)
(= (kreisring-fläche 4 5) #i28.27433388230814)



;; Berechnet die Mantelfläche eines Zylinders mit dem Radius r und der höhe h
(define zylinder-mantelfläche
  (lambda [r h]
    (* (kreis-umfang r) h)))

;; Beispielanwendungen
(= (zylinder-mantelfläche 5 2) #i62.83185307179586)
(= (zylinder-mantelfläche 2 2) #i25.132741228718345)



;; Berechnet den Außenradius eines rohrs aus dem innenradius und der dicke der Wand
(define rohr-außenradius
  (lambda [innenradius dicke]
    (+ innenradius dicke)))

;; Beispielanwendungen
(= (rohr-außenradius 4 4) 8)
(= (rohr-außenradius 1 5) 6)







;; ------------- Hauptfunktionen -------------

;; Aufgabe 8 a:
;; Berechnet das Volumen eines Zylinders mit dem Radius r und der höhe h
(define zylinder-volumen
  (lambda [r h] (* (kreis-fläche r) h)))

;; Beispielanwendungen
(= (zylinder-volumen 5 5) #i392.69908169872417)
(= (zylinder-volumen 2 6) #i75.39822368615503)



;; Aufgabe 8 b:
;; Berechnet die Oberfläche eines Zylinders mit dem Radius r und der höhe h
(define zylinder-oberfläche
  (lambda [r h] (+ (zylinder-mantelfläche r h) (kreis-fläche r))))

;; Beispielanwendungen
(= (zylinder-oberfläche 5 2) #i141.3716694115407)
(= (zylinder-oberfläche 2 2) #i37.69911184307752)



;; Aufgabe 8 c:
;; Berechnet die Oberfläche eines Rohrs mit einem innenradius, einer wandstärke und einer länge
(define rohr-oberfläche
  (lambda [innenradius wandstärke länge]
    ( +
      (* 2 (kreisring-fläche innenradius (rohr-außenradius innenradius wandstärke))) ;; 2 * kreis-ring
      (zylinder-mantelfläche innenradius länge) ;; mantel innen
      (zylinder-mantelfläche (rohr-außenradius innenradius wandstärke) länge) ;; mantel außen
      )))

;; Beispielanwendungen
(= (rohr-oberfläche 3 0.1 5) #i195.4698949063569)