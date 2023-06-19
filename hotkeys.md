:nmap - see custom keymaps
# Custom shortcuts

# Default shortcuts
#### Motions
- 0: start of line
- ^: first non-blank character of line
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
