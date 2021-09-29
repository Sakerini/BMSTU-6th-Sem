;;((1((2)3)4)(((5)))6(7(8)(9)a)b(c(d(e(f(g(h(i))))))))

(defun myflp1 (ar1, ar2, ar3, ar4)) (
    (list '(ar1 (list (ar2) ar3) ar4))
)

(defun myflp2 (ar7 ar8 ar9 ara))(
    (list (ar7 (list ar8) (list ar9) ara)
)

(defun myflp3 (arc ard are arf arg arh ari)) (
    (list c (list d (list e (list f (list g (list g (list h (list (i))))))))
)



(defun my-fl (ar1 ar2 ar3 ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, ar15 ar16, ar17, ar18)(
(list '((myflp1 'ar1 'ar2 'ar3 'ar4) (list (list (list '(ar5))) ar6 (myflp2 'ar7 'ar8 'ar9 'ara) arb (myflp3 'arc 'ard 'are 'arf 'arg 'arh 'ari))))
)

(print (my-fl '1 '2 '3 '4 '5 '6 '7 '8 '9 'a 'b 'c 'd' 'e 'f 'g' 'h 'i))