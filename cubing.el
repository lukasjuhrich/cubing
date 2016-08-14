(setq moves '("R" "U" "F" "L" "D" "B"))
(setq move-suffixes '("'" "2" ""))


(defun char-is-move (c)
  "Test whether the given char constitutes a valid move "
  (member (upcase (char-to-string c)) moves))

(defun cubing-quote-last-move ()
  "docstring"
  (interactive)
  (let ((nop nil) (no-space (not (eq (char-before) ?\ ))))
    (save-excursion
      (sp-backward-whitespace)
      (if (char-is-move (char-before)) (insert "'") (set 'nop t)))
    (if nop (insert "i")
      ;; if no fallback needed, make position cleanup
      (if no-space (forward-char) (delete-backward-char 1)))
    ))


;; global quote binding
;; (global-set-key (kbd "i") 'cubing-quote-last-move)
;; Backup binding
;; (global-set-key (kbd "i") 'self-insert-command)
