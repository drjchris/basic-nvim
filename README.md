# Minimalist Neovim Configuration

A lightweight, fast, and uncluttered Neovim setup using **vim-plug** and a carefully curated set of essential plugins.  
This configuration is designed for writing, research, note-taking, and general development, with a clean UI and sensible defaults.

The instructions are mainly for Arch Linux (btw), but I'm pretty sure they will
work on other distros (and Macs) with a few changed.

For Windows users there is one extra step - Delete Windows and install Linux.

---

## 🚀 Installation

### 1. Install Neovim  
Make sure you have Neovim (v0.8+ recommended).

### 2. Install **vim-plug**  
Run the following command:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### 3. Place the `init.lua`  
Save your `init.lua` here:

```
~/.config/nvim/init.lua
```

### 4. Install plugins  
Launch Neovim and run:

```
:PlugInstall
```

You're ready to go.

---

## ✨ Features

- Clean **Tokyo Night** theme with transparent UI  
- Automatic bracket/quote pairs  
- Table editing support for Markdown  
- Academic workflow integration using Telescope + BibTeX  
- 4-space indentation (2-space for Markdown/Quarto)  
- Relative numbers, clipboard sync, cursorline, scrolloff  
- Useful custom functions for wrapping/unwrapping text  
- Markdown/Quarto-aware autocommands  
- Minimal but practical keybindings

---

## 📦 Plugins Included

### 1. **Tokyo Night Theme**  
**Repo:** `folke/tokyonight.nvim`  
Provides a clean, modern colour scheme with:
- Transparent background  
- Transparent sidebars and floating windows  

---

### 2. **nvim-autopairs**  
**Repo:** `windwp/nvim-autopairs`  
Automatically inserts matching pairs.

---

### 3. **vim-table-mode**  
**Repo:** `dhruvasagar/vim-table-mode`  
Adds automatic table formatting and alignment for Markdown.

**Keymap:**  
- `<space>tm` → Toggle table mode

---

### 4. **Telescope + BibTeX**  
**Repos:**  
- `nvim-lua/plenary.nvim`  
- `nvim-telescope/telescope.nvim`  
- `nvim-telescope/telescope-bibtex.nvim`

Allows fuzzy search and insertion of BibTeX citations.

**Keymap:**  
- `<space>bib` → Open BibTeX search

---

## ⚙️ Core Settings

### Indentation
- Global: 4 spaces  
- Markdown/Quarto: 2 spaces  

### UI
- Relative line numbers  
- No wrap  
- Highlight cursorline  
- Scrolloff: 5  
- System clipboard integration  
- Colour support enabled  

---

## 🧠 Custom Text Functions

### Hard Wrap  
Wraps paragraph at **78 chars**.  
**Key:** `<space>tw`

### Unwrap  
Joins lines, then breaks sentences cleanly.  
**Key:** `<space>tu`

---

## 🧰 Autocommands

For `markdown`, `quarto`, `plaintext`:
- Colour column at 79  
- British English spell checking  
- 2-space indentation  
- No wrap  

Also includes yank highlighting.

---

## ⌨️ Keymap Summary

| Key | Action |
|-----|--------|
| `<Esc>` | Clear search highlight |
| `<space>fe` | Open file explorer |
| `<space>tw` | Hard wrap |
| `<space>tu` | Unwrap |
| `<space>tm` | Toggle table mode |
| `<space>bib` | Search BibTeX |

---

## 📁 About This File

This README describes the plugins and functionality included in the minimalist `init.lua`.

---

## 📜 License

MIT License  
Feel free to modify and share.
