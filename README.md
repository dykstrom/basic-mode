# basic-mode

Package basic-mode provides a major mode for editing BASIC code in GNU Emacs.
Features include syntax highlighting and indentation.

You can format the region, or the entire buffer, by typing _C-c C-f_.


### Installation

The easiest way to install basic-mode is from [MELPA](https://melpa.org).

To install manually, place basic-mode.el in your load-path, and add the
following lines of code to your init file:

```elisp
(autoload 'basic-mode "basic-mode" "Major mode for editing BASIC code." t)
(add-to-list 'auto-mode-alist '("\\.bas\\'" . basic-mode))
```


### Configuration

You can customize the indentation of code blocks, see variable
_basic-indent-offset_. The default value is 4.

You can also customize the number of columns to use for line numbers, see
variable _basic-line-number-cols_. The default value is 0, which means not
using line numbers at all.

Formatting is also affected by the customizable variables
_basic-delete-trailing-whitespace_ and _delete-trailing-lines_ (from
simple.el).
