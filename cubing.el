(setq moves '("R" "U" "F" "L" "D" "B"))
(setq moves-lower (mapcar 'downcase moves))
(setq move-suffixes '("'" "2" ""))

(defun string-is-move (s)
  "Test whether the given string constitutes a valid move "
  (member (upcase s) moves))

(defun cubing-quote-last-move ()
  "docstring"
  (interactive)
  (let ((nop nil)
        (no-space (not (eq (char-before) ?\ ))))
    (save-excursion
      (sp-backward-whitespace)
      (if (string-is-move (char-to-string (char-before)))
          (insert "'")
        (set 'nop t)))
    (if nop
        (insert "i")
      ;; if no fallback needed, make position cleanup
      (if no-space (forward-char) (delete-backward-char 1)))
    ))

(defun raw-insert-move (move)
  "Insert a move (str) as is"
  (interactive)
  (insert (upcase move))
  )

(defun insert-move (move)
  "Insert the move `move` (string) with context to the last move
on that line."
  (interactive)
  (if (string-is-move move)
      (save-excursion
        (sp-backward-whitespace)
        (if (string-equal (char-to-string (char-before)) move)
            (progn (insert "2") (just-one-space))
          (progn (just-one-space) (raw-insert-move move))))
    nil))

(defun self-insert-as-move (move)
  "insert"
  (interactive "K")
  (message (format "got move %s" (move)))
  (if (string-is-move move) (insert-move move) (self-insert-command 1))
  )

;; (mapcar (lambda (key-str) (local-set-key (kbd key-str) 'self-insert-as-move))
;;         moves-lower)
(mapcar (lambda (key-str) (local-set-key (kbd key-str) 'self-insert-command))
        moves-lower)
(local-set-key (kbd "u") 'self-insert-as-move)




;; Quote binding
;; (local-set-key (kbd "i") 'cubing-quote-last-move)
;; Backup binding
;; (global-set-key (kbd "i") 'self-insert-command)
;; R U2 R'
