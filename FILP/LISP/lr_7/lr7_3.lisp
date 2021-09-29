(defun find_in_pairs (lst name)
	(cond
		(
			(null lst)
			nil
		)
		(
			(equal (caar lst) name)
			(cdar lst)
		)
		(
			(equal (cdar lst) name)
			(caar lst)
		)
		(
			(find_in_pairs (cdr lst) name)
		)
	)
)

(print (find_in_pairs '((moscow . russia) (london . england) (washington . usa)) 'moscow))