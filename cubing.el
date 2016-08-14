(setq moves '("R" "U" "F" "L" "D" "B"))
(setq move-suffixes '("'" "2" ""))


(defun char-is-move (c)
  "Test whether the given char constitutes a valid move "
  (member (upcase (char-to-string c)) moves))

(defun move-before-spaces ()
  "Go backwards as long as not on the beginning of the line and
the previous char is space."
  (interactive)
  (while (char-equal (char-before) ?\ ) (backward-char)))

(defun cubing-quote-last-move ()
  "docstring"
  (interactive)
  (let ((nop nil) (no-space (not (eq (char-before) ?\ ))))
    (save-excursion
      (move-before-spaces)
      (if (char-is-move (char-before)) (insert "'") (set 'nop t)))
    (if nop (insert "i")
      ;; if no fallback needed, make position cleanup
      (if no-space (forward-char) (delete-backward-char 1)))
    ))


;; global quote binding
;; (global-set-key (kbd "i") 'cubing-quote-last-move)
;; Backup binding
;; (global-set-key (kbd "i") 'self-insert-command)
