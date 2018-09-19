# basic-mode

Package basic-mode provides a major mode for editing BASIC code in GNU Emacs.
Features include syntax highlighting and indentation, as well as support for
auto-numbering and renumering of code lines.


## Installation

The recommended way to install basic-mode is from [MELPA](https://melpa.org).

To install manually, place basic-mode.el in your load-path, and add the
following lines of code to your init file:

```elisp
(autoload 'basic-mode "basic-mode" "Major mode for editing BASIC code." t)
(add-to-list 'auto-mode-alist '("\\.bas\\'" . basic-mode))
```


## Usage


### Formatting Code

TAB indents the current line of BASIC code, including line numbers if available.
If the region is active, TAB indents all lines in the region.

_C-c C-f_ formats the entire buffer; indents all lines, and removes any extra
whitespace. If the region is active, _C-c C-f_ formats all lines in the region.


### Line Numbers

For classic BASIC, basic-mode provides several functions to manage line numbers.
Customize variables basic-auto-number and basic-line-number-cols to your liking
to turn on line numbers.

With line numbers turned on, RET will start new lines with a fresh line number.
The line number increment is defined by variable basic-auto-number. _C-c C-r_
will renumber all lines in the entire buffer, including any jumps in the code.
The line number increment used when renumbering is defined by variable
basic-renumber-increment. If the region is active, _C-c C-r_ renumbers all lines
in the region instead.

With line numbers turned on, _C-c C-f_ will also respect line numbers, and the
value configured in basic-line-number-cols while formatting.


### Navigation

Package basic-mode also provides additional functionality to navigate in the
source code. _M-._ will find and move to the line number, label, or variable at
point, and _M-,_ will move back again. For more information, see function
xref-find-definitions.


## Configuration

The following table lists the customizable variables that affect basic-mode
in some way:

<table>
  <tr>
    <th align="left">Name</th>
    <th align="left">Description</th>
    <th align="left">Default Value</th>
  </tr>
  <tr bgcolor="#EEEEFF">
    <td>basic-auto-number</td>
    <td>If non-nil, auto-number new lines by incrementing the line number with this value.</td>
    <td>nil</td>
  </tr>
  <tr>
    <td>basic-delete-trailing-whitespace</td>
    <td>If non-nil, basic-format-code deletes trailing whitespace while formatting.</td>
    <td>t</td>
  </tr>
  <tr bgcolor="#EEEEFF">
    <td>basic-indent-offset</td>
    <td>The number of columns to indent code blocks, for example inside an IF statement.</td>
    <td>4</td>
  </tr>
  <tr>
    <td>basic-line-number-cols</td>
    <td>The number of columns allocated to line numbers at the beginning of the line.</td>
    <td>0</td>
  </tr>
  <tr bgcolor="#EEEEFF">
    <td>basic-mode-hook</td>
    <td>Hook run when entering BASIC mode.</td>
    <td>nil</td>
  </tr>
  <tr>
    <td>basic-renumber-increment</td>
    <td>Default line number increment when renumbering lines.</td>
    <td>10</td>
  </tr>
  <tr bgcolor="#EEEEFF">
    <td>basic-renumber-unnumbered-lines</td>
    <td>If non-nil, lines without line numbers are also renumbered when renumbering lines.</td>
    <td>t</td>
  </tr>
  <tr>
    <td>delete-trailing-lines (simple.el)</td>
    <td>If non-nil, basic-format-code deletes trailing empty lines while formatting.</td>
    <td>t</td>
  </tr>
</table>

[![MELPA](https://melpa.org/packages/basic-mode-badge.svg)](https://melpa.org/#/basic-mode)
