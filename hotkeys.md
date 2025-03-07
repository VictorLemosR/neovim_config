https://vim.rtorr.com/

:verbose map - see all keymaps
:nmap - see custom keymaps

# Custom shortcuts

# Default shortcuts
#### Motions
- 0: start of line
- ^ or _: first non-blank character of line
- 0w: first word of line
- $: end of line
- G: end of file
- gg: start of file
- 180G: go to line 180
- J or K: while in visual mode, move all highlighted lines down or up
- f{char}: to next {char} in line
- F{char}: back next {char} in line
- w: next word, start of it
- e: next word, end of it
- b: backwards word
- %: if on bracket or if statement, go to its match
- *: search for instances of the word within the file
- a: insert text after cursor
- A: insert text at end of line
- i: insert text before cursor
- I: insert text at start of line
- ce: delete from cursor to end of word and enter insert mode
- c3l: delete 3 letters
- u: undo
- U: undo whole line (kinda messes undo and redo)
- ctl+r: redo
- :s/old/new: replace word old for new
-- %s: substitution on whole file
-- /g: all occurrences on line
-- /c: confirm each substitution
-- /i: ignore case
--- :%s/old/new/ci: will replace 'old' for 'new'
- vaw: mark a word
- vab: mark block inside of parenthesis including ()
- vib: mark block inside of parenthesis excluding ()
- ]s: next spelling mistake
- [s: previous spelling mistake
- ~: while in visual mode, switch case
- ma: put a mark on a line. move to it using 'a
-- mb: put a mark on another line and move to it using 'b
-- `a move to exact character location of the mark
- zo: open one fold under cursor
-- zO: open all folds under the cursor
- zc: close one fold under cursor
-- zC: close all folds under the cursor
- zR: open all folds
- zM: close all folds
- gu: convert all leters to lowercase
	- gU: converte all leters to uppercase


#### Deletion mode

- ciw: delete whole word and enter insertion mode
- ci' or ci": search for first ' (or ") and delete its contents

- :w - write file
- :q - close vim
- :bd! - to delete from buffer and ignore changes

#### After selecting lines in visual mode
- Comment - :s/^/--
- Uncomment - :s/^--/

## Windows management

ctrl + w + v: split vertically
ctrl + w + n: split horizontally
ctrl + w + hjkl: move left, down, up, right
ctrl + w + q: quit current window
ctrl + w + r: rotate windows
Git
https://supersimpledev.github.io/references/git-github-reference.pdf
https://supersimple.dev/courses/git-github-complete-course-20211
