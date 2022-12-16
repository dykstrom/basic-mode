# basic-mode

<div style="text-align: left">

[![MELPA](https://melpa.org/packages/basic-mode-badge.svg)](https://melpa.org/#/basic-mode)
[![MELPA Stable](https://stable.melpa.org/packages/basic-mode-badge.svg)](https://stable.melpa.org/#/basic-mode)
[![Open Issues](https://img.shields.io/github/issues/dykstrom/basic-mode)](https://github.com/dykstrom/basic-mode/issues)
![License](https://img.shields.io/github/license/dykstrom/basic-mode)

</div>

Package basic-mode provides a major mode for editing BASIC code in GNU Emacs.
Features include syntax highlighting and indentation, as well as support for
auto-numbering and renumbering of code lines.

<!-- TOC -->
* [basic-mode](#basic-mode)
  * [Installation](#installation)
  * [BASIC Dialects](#basic-dialects)
    * [Setting Sub Mode](#setting-sub-mode)
      * [Manually](#manually)
      * [File Variable](#file-variable)
      * [Init File](#init-file)
    * [Available Sub Modes](#available-sub-modes)
  * [Usage](#usage)
    * [Formatting Code](#formatting-code)
    * [Line Numbers](#line-numbers)
    * [Navigation](#navigation)
  * [Configuration](#configuration)
<!-- TOC -->

## Installation

The recommended way to install basic-mode is from [MELPA](https://melpa.org).

To install manually, place basic-mode.el in your load-path, and add the
following lines of code to your init file:

```elisp
(autoload 'basic-mode "basic-mode" "Major mode for editing BASIC code." t)
(add-to-list 'auto-mode-alist '("\\.bas\\'" . basic-generic-mode))
```


## BASIC Dialects

Package basic-mode supports some of the many 
[BASIC dialects](https://en.wikipedia.org/wiki/List_of_BASIC_dialects) using
sub modes derived from the main basic-mode. Section 
[Available Sub Modes](#available-sub-modes) lists the currently existing 
sub modes. In addition, basic-mode also provides a generic sub mode that will 
be used if no sub mode is specified.

The sub mode configures, among other things, syntax highlighting and indentation,
which differs between dialects.


### Setting Sub Mode

By default, basic-mode will open BASIC files in sub mode _basic-generic-mode_. 
There are several ways to change that behaviour if you prefer a specific sub mode.


#### Manually

After opening a file in Emacs, you can type _M-x MODE-NAME_ to set the sub mode,
e.g. _M-x basic-zx81-mode_ to set the Sinclair ZX81 sub mode. 


#### File Variable

You can specify the sub mode as a file variable in the first line of the file, see
[Specifying File Variables](https://www.gnu.org/software/emacs/manual/html_node/emacs/Specifying-File-Variables.html)
in the GNU Emacs Manual. For example, a file beginning with this line, will open in
the TRS-80 Model 100 sub mode.

```BASIC
10 REM -*- basic-m100 -*-
```

#### Init File

If you are always working with a specific BASIC dialect, you can configure Emacs to
always open BASIC files in that sub mode. For example, adding the below line to your 
init file will open all BASIC files in the Sinclair ZX81 sub mode.

```elisp
(add-to-list 'auto-mode-alist '("\\.bas\\'" . basic-zx81-mode))
```


### Available Sub Modes

This table lists the existing sub modes. If you feel that a sub mode
is missing, the best way to bring it into existence is to create it 
yourself, and submit a pull request to include it in basic-mode.

<table>
  <tr>
    <th align="left">BASIC Dialect</th>
    <th align="left">Sub Mode</th>
  </tr>
  <tr>
    <td>Microsoft QuickBasic 4.5</td>
    <td>basic-qb45-mode</td>
  </tr>
  <tr>
    <td>Sinclair ZX81</td>
    <td>basic-zx81-mode</td>
  </tr>
  <tr>
    <td>Sinclair ZX Spectrum</td>
    <td>basic-spectrum-mode</td>
  </tr>
  <tr>
    <td>TRS-80 Model I and III</td>
    <td>basic-trs80-mode</td>
  </tr>
  <tr>
    <td>TRS-80 Model 100</td>
    <td>basic-m100-mode</td>
  </tr>
</table>


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
    <td>basic-syntax-highlighting-require-separator</td>
    <td>
    If non-nil, only keywords separated by separators will be highlighted.
    If nil, keywords separated by numbers will also be highlighted.
    </td>
    <td>t</td>
  </tr>
  <tr bgcolor="#EEEEFF">
    <td>delete-trailing-lines (simple.el)</td>
    <td>If non-nil, basic-format-code deletes trailing empty lines while formatting.</td>
    <td>t</td>
  </tr>
</table>

Additionally, each sub mode will also define a hook variable, named like
the sub mode, e.g. _basic-generic-mode-hook_ for the generic sub mode.