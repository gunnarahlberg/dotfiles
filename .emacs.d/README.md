# Editing Clojure with Emacs

This gist will guide you to setting up a basic [emacs-starter-kit](https://github.com/technomancy/emacs-starter-kit)-based Emacs configuration for editing Clojure.

Contents:

* [Getting Emacs](https://gist.github.com/rkneufeld/5126926#getting-emacs) - How to get Emacs.
* [Installing the config](https://gist.github.com/rkneufeld/5126926#installing-the-config) - How to install this config.
    * [A special note for Mac users](https://gist.github.com/rkneufeld/5126926#a-special-note-for-mac-users).
* [Keyboard shortcuts](https://gist.github.com/rkneufeld/5126926#keyboard-shortcuts) - Keybindings used during the presentation.

## Getting Emacs

The first step is to get Emacs. Whatever you do, just make sure you get Emacs 24.

To paraphrase [Install the right Emacs](http://david.rothlis.net/emacs/install.html):

* On a Mac? Also see [note for Mac users](https://gist.github.com/rkneufeld/5126926#a-special-note-for-mac-users).

        $ brew install emacs --cocoa
    
* On Linux?
    
        $ your-package-manager install emacs

* On Windows?
    * Download the latest version of emacs from [http://ftp.gnu.org/pub/gnu/emacs/windows/](http://ftp.gnu.org/pub/gnu/emacs/windows/).
    * Follow the rest of the instructions on [Install the right Emacs](http://david.rothlis.net/emacs/install.html).

Once you've installed Emacs verify you have the correct version with `emacs --version`

    ▸ emacs --version
    GNU Emacs 24.2.1
    Copyright (C) 2012 Free Software Foundation, Inc.
    GNU Emacs comes with ABSOLUTELY NO WARRANTY.
    You may redistribute copies of Emacs
    under the terms of the GNU General Public License.
    For more information about these matters, see the file named COPYING.

Now, for the config...

## Installing the config

**Prerequisite**: Install Leiningen. [Installation instructions](http://leiningen.org/#install).

To follow along with the contents of the presentation I would suggest you download and install the Emacs configuration bundled in this gist like so:

1. Clean out any existing Emacs configurations you have.
2. Clone this gist to your `~/.emacs.d` folder with the command

        $ git clone https://gist.github.com/5126926.git ~/.emacs.d

3. Launch emacs without any arguments like `$ emacs`. You'll see a number of package fetch and compilation messages fly by as Emacs installs all of the packages specified in init.el.
 
If you didn't encounter any errors you've likely arrived at a simple, stable Emacs configuration. The configuration is annotated, so feel free to read and edit as you see fit.

Enjoy

### A special note for Mac users

If you try to follow along into the Paredit sections you'll be sorely disappointed when you start trying to do things like `C-→`. The problem is this: **every** Mac terminal sends the incorrect key codes to your terminal, and by-proxy, Emacs.

Fix this by following the excellent instructions of Cosmin Stejerean's [Emacs + paredit under terminal](http://offbytwo.com/2012/01/15/emacs-plus-paredit-under-terminal.html). His instructions address how to fix Terminal.app, iTerm and iTerm2 to send the proper key codes for using Paredit.

## Keyboard Shortcuts

**Protip**: To find out what any keybinding does use `C-h k` followed by the keybinding in question to discover what it does.

### REPL-driven Development with nREPL:

| Keybinding                                            | Result                                                                                                           |
| ----------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `M-x nrepl-jack-in`, `C-c M-j` (when in Clojure file) | Open an nREPL session. Intelligently loads project context if launched from any file within a Leiningen project. |
| `C-↑`, `C-↓`                                          | Browse up or down through nREPL's history of commands.                                                           |
| `C-x 3 `                                              | Split window vertically                                                                                          |
| `C-x f`                                               | Open file                                                                                                        |
| `C-M-x`                                               | Evaluate expression at cursor. This command evaluates whatever top-level expression is under your cursor.        |
| `C-c M-n`                                             | Change the namespace of your nREPL REPL to match the command was issued from.                                    |
| `C-c C-k`                                             | Evaluate an entire file.                                                                                         |
| `C-c C-e`                                             | Evaluate the expression preceding your cursor.                                                                   |
| `C-c C-r`                                             | Evaluate a selected region. Start selecting text with the keybinding `C-Space`.                                  |
| `M-.`                                                 | Jump to the definition of the symbol under your cursor.                                                          |
| `M-,`                                                 | Jump back one level (after jumping with `M-.`).                                                                  |

### Paredit

| Keybinding | Result                                                                                                                                                                                                                      |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `C-→`      | Absorb one expression from the right of the current expression<br>Also try `C-←`, `C-M-→` and `C-M-←`<br><br>Example: `(+ 1 2) 3` → `(+ 1 2 3)`                                                                             |
| `M-↑`      | "Splice sexp killing backwards". A utility-knife of a command that unwraps an expression, deleting anything before the cursor.<br>Example: `(filter :completed? (map (fn [[_ v]] v)▋todos))`  ⃗ `(filter :completed? todos)` |

