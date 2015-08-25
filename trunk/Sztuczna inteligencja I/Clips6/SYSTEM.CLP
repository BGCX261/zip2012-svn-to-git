(defrule startujemy
?x <- (initial-fact)
=>
(retract ?x)
(assert(start))
(printout t crlf)
(printout t "SYSTEM DIAGNOSTYKI SILNIKA SPALINOWEGO" crlf)
(printout t crlf)
(printout t "Implementacja w jêzyku Clips" crlf)
(printout t crlf)
(printout t "Proszê odpowiadaæ na pytania tylko t lub n." crlf)
(printout t crlf))

(defrule R0
?x <- (start)
=>
(retract ?x)
(printout t crlf)
(printout t "Zaczynamy!" crlf)
(printout t crlf)
(printout t "Czy paliwo jest w zbiorniku?" crlf)
(assert(paliwo(read))))

(defrule R1
?x <- (paliwo ?paliwo-read&n|N)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Nale¿y uzupelniæ paliwo" crlf)
(assert(gotowe)))

(defrule R2
?x <- (paliwo ?paliwo-read&t|T)
=>
(retract ?x)
(printout t "Czy kranik dop³ywu paliwa jest zamkniêty?" crlf)
(assert(kranik(read))))

(defrule R3
?x <- (kranik ?kranik-read&t|T)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Nale¿y otworzyæ kranik dop³ywu paliwa" crlf)
(assert(gotowe)))

(defrule R4
?x <- (kranik ?kranik-read&n|N)
=>
(retract ?x)
(printout t "Odczekaj 5 minut. Czy nastêpna próba siê powiod³a?" crlf)
(assert(proba(read))))

(defrule R5
?x <- (proba ?proba-read&t|T)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Ju¿ wszystko w porz¹dku" crlf)
(assert(gotowe)))

(defrule R6
?x <- (proba ?proba-read&n|N)
=>
(retract ?x)
(printout t "Czy paliwo dop³ywa do ga¿nika?" crlf)
(assert(gaznik(read))))

(defrule R7
?x <- (gaznik ?gaznik-rad&n|N)
=>
(retract ?x)
(printout t "Czy paliwo wyp³ywa z przewodu doprowadzaj¹cego je do pompy" crlf)
(assert(wyplywa(read))))

(defrule R8
?x <- (wyplywa ?wyplywa-read&n|N)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Pêkniêty przewód doprowadzaj¹cy paliwo lub zanieczyszczony zbiornik" crlf)
(assert(gotowe)))

(defrule R9
?x <- (wyplywa ?wyplywa-read&t|T)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Uszkodzenie pompy paliwa" crlf)
(assert(gotowe)))

(defrule R10
?x <- (gaznik ?gaznik-read&t|T)
=>
(retract ?x)
(printout t "Czy ustawienie przes³ony rozruchowej jest prawid³owe?" crlf)
(assert(przeslona(read))))

(defrule R11
?x <- (przeslona ?przeslona-read&n|N)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Nale¿y uruchomiæ przes³onê rozruchow¹" crlf)
(assert(gotowe)))

(defrule R12
?x <- (przeslona ?przeslona-read&t|T)
=>
(retract ?x)
(printout t "Czy g³ówna dysza paliwowa jest dro¿na?" crlf)
(assert(dysza(read))))

(defrule R13
?x <- (dysza ?dysza-read&n|N)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Nale¿y oczyœciæ g³ówn¹ dyszê paliwa" crlf)
(assert(gotowe)))

(defrule R14
?x <- (dysza ?dysza-read&t|T)
=>
(retract ?x)
(printout t crlf)
(printout t "Moim zdaniem:" crlf)
(printout t "Zanieczyszczona dysza biegu ja³owego lub awaria w uk³adzie zap³onowym." crlf)
(assert(gotowe)))

(defrule koniec
?x <- (gotowe)
=>
(retract ?x)
(printout t "EKSPERTYZA ZAKOÑCZONA" crlf)
(printout t "Czy chcesz nastêpnej diagnozy?" crlf)
(assert(nastepna(read))))

(defrule nast
?x <-(nastepna ?nastepna-read&t|T)
=>
(retract ?x)
(assert(start)))
