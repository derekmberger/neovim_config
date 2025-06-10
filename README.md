# DerekMBerger's init.lua
Prerequisite: install [ripgrep](https://github.com/BurntSushi/ripgrep).
[The full video for setting up this repo](https://www.youtube.com/watch?v=w7i4amO_zaE)

## Neovim Packages

### Plugin Manager & Utilities

* **lazy.nvim**
  A fast, minimalistic Neovim plugin manager that supports lazy-loading; it’s the backbone orchestrating when and how your other plugins load.

* **plenary.nvim** (and alias **plenary**)
  A Lua utility library used by many Neovim plugins; provides async helpers, path handling, and more so you don’t have to reimplement common functions.

---

### LSP, Completion & Snippets

* **nvim-lspconfig**
  Quick-start configurations for Neovim’s built-in Language Server Protocol client, giving you diagnostics, code actions, etc., “out of the box.”

* **mason.nvim**
  A package manager for LSP servers, DAP servers, linters, and formatters—so you can install & update them from inside Neovim.

* **mason-lspconfig.nvim**
  Glue between Mason and nvim-lspconfig: automatically wires up installed servers without manual config.

* **fidget.nvim**
  Displays a little “spinner” UI in the corner showing LSP progress (indexing, formatting), so you know when background work is happening.

* **nvim-cmp**
  A modular autocompletion engine for Neovim. Handles completion menus, snippet expansion, and integrates with various sources.

* **cmp-nvim-lsp**
  Feeds completion candidates from your LSP servers into nvim-cmp.

* **cmp-buffer**
  Adds words from the current buffer as completion suggestions.

* **cmp-path**
  Offers filesystem path completions.

* **cmp-cmdline**
  Enables completion in Neovim’s command-line (`:`) and search (`/`), so you get the same fuzzy matching there.

* **cmp\_luasnip**
  Lets nvim-cmp complete LuaSnip snippets.

* **LuaSnip**
  A snippet engine written in Lua, so you can expand and jump through code snippets.

* **friendly-snippets**
  A curated collection of ready-to-use snippets for many languages, compatible out-of-the-box with LuaSnip.

* **neogen**
  Generates doc-comment boilerplate based on LSP type/signature info—speeds up writing and maintaining code docs.

* **editorconfig.nvim**
  Honors your `.editorconfig` settings (indent style, line endings) automatically as you open files.

---

### Syntax & Treesitter

* **nvim-treesitter**
  Uses Tree-sitter parsers for fast, accurate syntax highlighting, indenting, and code analysis.

* **nvim-treesitter-context**
  Keeps the current function/class signature visible at the top of the window as you scroll, improving orientation in large files.

---

### Fuzzy-Finding & Navigation

* **telescope.nvim**
  A highly extensible fuzzy-finder UI: files, buffers, LSP symbols, git status, live grep—you name it, Telescope can search it.

---

### UI & Theming

* **rose-pine**
  A soft, pastel-inspired color scheme that’s easy on the eyes.

* **tokyonight.nvim**
  A popular dark theme with high contrast and vibrant accents.

* **trouble.nvim**
  A “pretty” diagnostics list in a sidebar—you can jump to errors, warnings, or LSP references with a keystroke.

* **zen-mode.nvim**
  Centers your editing area and hides distractions (statusline, folds, gutters), for focused, distraction-free work.

* **undotree**
  Visualizes and lets you traverse your undo history as a tree, so you can recover code you’ve long since changed.

---

### Git & Version Control

* **vim-fugitive**
  The de-facto Git integration for Vim/Neovim—runs `:Gstatus`, `:Gblame`, `:Gdiff`, etc., all inside your editor.

* **cloak.nvim**
  Masks sensitive lines (like API keys) in your buffers—great for working on configs without accidentally exposing secrets.

---

### Testing & Productivity

* **neotest**
  A framework for running tests from within Neovim.

* **neotest-plenary** & **neotest-vitest**
  Adapters that let `neotest` run your Lua tests (via Plenary) and JavaScript/TypeScript tests (via Vitest).

* **cellular-automaton.nvim**
  A fun toy that runs Conway’s Game of Life (and variants) in a buffer—just for amusement or demo purposes.

* **vim-be-good**
  An interactive “game” to practice your Vim motions and improve speed/accuracy.

* **FixCursorHold.nvim**
  Works around a Neovim issue where `CursorHold` events can lag; improves the responsiveness of LSP hover, diagnostics popups, etc.

## Neovim Keymaps
Below is a “crib sheet” that puts the *essential* Neovim keys side‑by‑side with every **custom** mapping found in your configuration.  Skim the “Built‑ins you should know first” once, then focus on the “Your custom mappings” section—those are the keys that will feel “magic” in **your** setup.

---

## 1 · Built‑ins you should know first (no plugins required)

| Mode       | Key(s)          | What it does                                  |
| ---------- | --------------- | --------------------------------------------- |
| **Normal** | `h j k l`       | Move left / down / up / right                 |
|            | `w / b`         | Next / previous word                          |
|            | `gg` / `G`      | Top / bottom of file                          |
|            | `0` / `$`       | Line start / end                              |
|            | `u` / `Ctrl‑r`  | Undo / redo                                   |
|            | `:` / `/` / `?` | Ex command / forward search / backward search |
|            | `:help {topic}` | Built‑in help                                 |

*(If these feel foreign, play the **vim‑be‑good** game: `:VimBeGood`.)*

---

## 2 · Your global settings

* **Leader key** → **Space** (`vim.g.mapleader = " "`).
  Every mapping that starts with `<leader>` really means **Space**.

* **jj to keep cursor centred** → Many motions end with `zz` to recenter.

* **Saving** / **exiting** are unchanged (`:w`, `:q`, etc.).

---

## 3 · Your custom mappings (the fun stuff)

### 3.1  File tree / netrw

| Key          | Mode  | Action                              |
| ------------ | ----- | ----------------------------------- |
| `<leader>pv` | **n** | Open *netrw* file explorer (`:Ex`). |

---

### 3.2  Search & navigation (Telescope + core tweaks)

| Key                 | Mode | Action                                           |
| ------------------- | ---- | ------------------------------------------------ |
| `<leader>pf`        | n    | Telescope *find\_files* (project files).         |
| `Ctrl‑p`            | n    | Telescope *git\_files* (tracked only).           |
| `<leader>pws`       | n    | Search word under cursor (`grep_string`).        |
| `<leader>pWs`       | n    | Search WORD under cursor (includes punctuation). |
| `<leader>ps`        | n    | Live grep for custom input.                      |
| `<leader>vh`        | n    | Telescope help tags.                             |
| `<leader>ptf`       | n    | `terraform fmt` picker (Telescope‑Terraform).    |
| `<leader>ptv`       | n    | `terraform validate` picker.                     |
| `n` / `N`           | n    | After search, keep result centred (`zzzv`).      |
| `Ctrl‑d` / `Ctrl‑u` | n    | Half‑page jump, cursor centred.                  |

---

### 3.3  Editing quality‑of‑life

| Key                       | Mode  | Action                                                        |
| ------------------------- | ----- | ------------------------------------------------------------- |
| `J`                       | **v** | Move selected lines **down** one line.                        |
| `K`                       | v     | Move selected lines **up** one line.                          |
| `J`                       | n     | Join line below *without* moving cursor.                      |
| `<leader>y` / `<leader>Y` | n,v   | Yank to system clipboard.                                     |
| `<leader>d`               | n,v   | Delete without yanking (black‑hole reg).                      |
| `<leader>p`               | v     | Paste over selection **without** clobbering default register. |
| `=ap`                     | n     | Re‑indent paragraph under cursor.                             |
| `<leader>s`               | n     | Global word‑under‑cursor substitution template.               |
| `<leader>x`               | n     | `chmod +x` current file (make executable).                    |
| `Ctrl‑c`                  | i     | Quick **Esc** (insert → normal).                              |
| `Q`                       | n     | Disabled (avoids accidental *Ex mode*).                       |

---

### 3.4  Formatting & LSP (on *any* language server buffer)

| Key           | Mode | Action                                      |
| ------------- | ---- | ------------------------------------------- |
| `gd`          | n    | Go to definition.                           |
| `K`           | n    | Hover docs.                                 |
| `[d` / `]d`   | n    | Next / previous diagnostic.                 |
| `<leader>vd`  | n    | Floating diagnostic window.                 |
| `<leader>vws` | n    | Workspace symbol search.                    |
| `<leader>vca` | n    | Code actions.                               |
| `<leader>vrr` | n    | References.                                 |
| `<leader>vrn` | n    | Rename symbol.                              |
| `Ctrl‑h`      | i    | Signature help while typing.                |
| `<leader>f`   | n    | Format current buffer via **conform.nvim**. |
| `<leader>zig` | n    | Restart Zig LSP client.                     |

---

### 3.5  Git (Fugitive)

| Key                                | Mode | Action                                |
| ---------------------------------- | ---- | ------------------------------------- |
| `<leader>gs`                       | n    | `:Git` status window.                 |
| **inside Fugitive status window**: |      |                                       |
| `<leader>p`                        | n    | `git push`.                           |
| `<leader>P`                        | n    | `git pull --rebase`.                  |
| `<leader>t`                        | n    | `git push -u origin <branch>` prompt. |
| `gu`                               | n    | Take *ours* in diff view.             |
| `gh`                               | n    | Take *theirs* in diff view.           |

---

### 3.6  Telescope quick‑marks (Harpoon ‑ *local plugin*)

| Key                       | Mode | Action                                               |
| ------------------------- | ---- | ---------------------------------------------------- |
| `<leader>a` / `<leader>A` | n    | Add current file to Harpoon list / prepend to front. |
| `Ctrl‑e`                  | n    | Toggle Harpoon quick‑menu.                           |
| `Ctrl‑h/t/n/s`            | n    | Jump to file 1/2/3/4.                                |
| `<leader><Ctrl‑h/t/n/s>`  | n    | Replace slot 1‑4 with current file.                  |

---

### 3.7  Debug‑Adapter‑Protocol (nvim‑dap + dap‑ui)

| Key               | Mode | Action                        |
| ----------------- | ---- | ----------------------------- |
| **Core controls** |      |                               |
| `F8`              | n    | Continue / start.             |
| `F10`             | n    | Step over.                    |
| `F11`             | n    | Step into.                    |
| `F12`             | n    | Step out.                     |
| `<leader>b`       | n    | Toggle breakpoint.            |
| `<leader>B`       | n    | Set *conditional* breakpoint. |
| **UI panels**     |      |                               |
| `<leader>dr`      | n    | Toggle *REPL* panel.          |
| `<leader>ds`      | n    | Stacks.                       |
| `<leader>dw`      | n    | Watches.                      |
| `<leader>db`      | n    | Breakpoints.                  |
| `<leader>dS`      | n    | Scopes.                       |
| `<leader>dc`      | n    | Console.                      |

---

### 3.8  Testing (neotest + Go adapter)

| Key          | Mode | Action                                   |
| ------------ | ---- | ---------------------------------------- |
| `<leader>tr` | n    | Run **nearest** test (go‑testify aware). |
| `<leader>ts` | n    | Run **entire suite** in file.            |
| `<leader>td` | n    | **Debug** nearest test (DAP).            |
| `<leader>to` | n    | Open test output panel.                  |
| `<leader>ta` | n    | Run tests for whole project.             |
| `<leader>tv` | n    | Toggle test summary tree.                |

---

### 3.9  Diagnostics list (Trouble)

\| `<leader>tt` | Toggle Trouble window
\| `[t` / `]t`  | Jump to next / previous item inside Trouble.

---

### 3.10  Undo history

\| `<leader>u` | Show / hide **Undotree** sidebar. |

---

### 3.11  Distraction‑free writing

| Key          | Mode | Action                                   |
| ------------ | ---- | ---------------------------------------- |
| `<leader>zz` | n    | Zen‑Mode (80‑col, *relative number ON*). |
| `<leader>zZ` | n    | Zen‑Mode (80‑col, *numbers OFF*).        |

---

### 3.12  Misc “fun / helpers”

| Key                                                    | Mode | Action                                               |
| ------------------------------------------------------ | ---- | ---------------------------------------------------- |
| `<leader>vwm`                                          | n    | Start **Vim‑With‑Me** collaborative editing session. |
| `<leader>svwm`                                         | n    | Stop Vim‑With‑Me session.                            |
| `<leader>ca`                                           | n    | Run *Cellular Automaton* “make it rain” animation.   |
| `<leader><leader>`                                     | n    | `:so` – re‑source current Lua/vimscript file.        |
| `<leader>ee`, `<leader>ea`, `<leader>ef`, `<leader>el` | n    | Insert Go‑style error‑handling templates.            |

---

## 4 · Plugin‑specific motions to remember

| Plugin        | “Muscle‑memory” command                                                      |
| ------------- | ---------------------------------------------------------------------------- |
| **Telescope** | Once open: `Ctrl‑j` / `Ctrl‑k` to move, `Enter` to select, `<Esc>` to close. |
| **Trouble**   | In the list: `Enter` to jump, `q` to close.                                  |
| **DAP‑UI**    | `o` expand node, `r` run value eval; `q` closes panel.                       |
| **Harpoon**   | In quick‑menu: `a` add, `d` delete, `Enter` go.                              |
| **Undotree**  | `p` to preview state, `Enter` to restore, `q` close.                         |

---
