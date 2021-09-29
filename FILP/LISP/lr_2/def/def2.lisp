;( (1((2)(3)) (4)) ((5)) 6 ((7) 8 (9)) )

;(print (list '1 (list (list '2) (list '3)) (list '4)))



;(print (cons '1 (cons (cons (cons '2 Nil) (cons (cons '3 Nil) Nil)) (cons '4 Nil))))


;(defun test (ar1 ar2 ar3 ar4 ar5 ar6 ar7 ar8 ar9)
 ;   (ar1 ((2) (3)) (4) ((5)) 6 ((7) 8 (9)))
;)

;(print (test '1 '2 '3 '4 '5 '6 '7 '8 '9)

(defun test (ar1 ar2 ar3 ar4 ar5 ar6 ar7 ar8 ar9)
  (print (ar1 ((ar2) (ar3)) (ar4) ((ar5)) ar6 ((ar7) ar8 (ar9))))
)
(test 1 2 3 4 5 6 7 8 9)