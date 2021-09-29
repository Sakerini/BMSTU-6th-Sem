(defun hypotenuse (a b)
    (sqrt (+ (* a a) (* b b)))
)

(defun volume (a b c)
    (* a b c)
)

(defun longer_then (list1 list2)
    (> (length list1) (length list2))
)

(print (hypotenuse '4 '3))
(print (volume '2 '3 '4))

(print (longer_then '(1 2 3) '(1 2)))
(print (longer_then '(1 2 3) '(1 2 3 4)))

(print (+ (length '(1 foo 2 too)) (car '(21 22 23))))   