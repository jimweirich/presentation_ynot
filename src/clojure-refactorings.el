;; The following are 4 of the 5 functional crfings used in the
;; Y-Combinator deriviation.  Function inlining is not included
;; because it is pretty trivial to do by hand.

;; Perform a Tennent Correspondence Principle refactoring
(defun crf-tennent ()
  (interactive)
  (save-excursion
    (paredit-open-round)
    (paredit-forward-slurp-sexp)
    (paredit-open-round)
    (insert-string "fn []")
    (paredit-forward-slurp-sexp)))

;; Peform an Introduce Binding refactoring
(defun crf-introduce-binding (variable-name value)
  (interactive "MVariable: \nMValue: ")
  (save-excursion
    (search-forward "[")
    (insert-string variable-name))
  (save-excursion
    (paredit-forward)
    (insert-string " ")
    (insert-string value)))

;; Preform a Rebind refactoring
(defun crf-rebind (variable-name)
  (interactive "MVariable to rebind: ")
  (save-excursion
    (search-forward "[")
    (insert-string variable-name))
  (save-excursion
    (paredit-forward)
    (insert-string " ")
    (insert-string variable-name)))

;; Perform a Wrap Function refactoring
(defun crf-wrap-function (argument-name)
  (interactive "MArgument Name: ")
  (save-excursion
    (paredit-open-round)
    (paredit-forward-slurp-sexp)
    (insert-string "fn ")
    (paredit-open-square)
    (insert-string argument-name)
    (search-forward "(")
    (backward-char 1)
    (paredit-open-round)
    (paredit-forward-slurp-sexp)
    (paredit-forward-delete)
    (paredit-forward)
    (insert-string " ")
    (insert-string argument-name)))
