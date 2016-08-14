# Cubing mode #

This is a major mode providing some neat keybindings to insert cubing
algorithms, at least for the 3x3x3.

## Keybindings ##

`r, u, f, l, d, b`

Insert character in uppercase.  If the previous character (ignoring
whitespace) is the same as the one typed in, turn it into the double
move.  E.g., `u u` gives `U2`.  If the previous character is
different, prepend a space character.

`i`, `,`

If the previous character (ignoring whitespace) is a valid move,
append a single quote and a space character.

## Global examples ##

Input: `uurifrfi`, output: `U2 R' F R F'`
