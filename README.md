# Joakim's Dotfiles

A collection of configuration files for terminal environments, editors, multiplexers, and other tools, managed using **GNU Stow** on macOS.

---

## 🛠️ The Stack

This environment is optimized for a fast, modern, and vim-like terminal workflow.

- **Shell**: [Zsh](https://www.zsh.org/) managed with [Oh My Zsh](https://ohmyz.sh/) and the beautiful, informative [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt.
- **Multiplexer**: [Tmux](https://github.com/tmux/tmux) with vim-like navigation, powered by the [Dracula](https://draculatheme.com/tmux) theme and managed via TPM (Tmux Plugin Manager).
- **Text Editor**: [Neovim](https://neovim.io/) configured from scratch using [Lazy.nvim](https://github.com/folke/lazy.nvim) for package management.
- **Git Client**: [Lazygit](https://github.com/jesseduffield/lazygit) for lightning-fast Git staging and commits.
- **Version Managers**: `pyenv` for managing Python environments.

---

## 📂 Repository Structure

- [.zshrc](file:///Users/joakim/dotfiles/.zshrc) - Shell configuration, custom aliases, movements, and environment variables.
- [.p10k.zsh](file:///Users/joakim/dotfiles/.p10k.zsh) - Detailed styling configuration for the Powerlevel10k prompt.
- [.tmux.conf](file:///Users/joakim/dotfiles/.tmux.conf) - Multiplexer setup, pane navigation shortcuts, and Dracula theme configurations.
- [.config/nvim/](file:///Users/joakim/dotfiles/.config/nvim/) - Complete Neovim setup:
  - [init.lua](file:///Users/joakim/dotfiles/.config/nvim/init.lua) - Neovim entry point and configuration loading.
  - [lua/joakim/remap.lua](file:///Users/joakim/dotfiles/.config/nvim/lua/joakim/remap.lua) - Custom keymaps (Leader is `<Space>`, Comment box generation, clear search highlights, etc.).
  - [lua/joakim/set.lua](file:///Users/joakim/dotfiles/.config/nvim/lua/joakim/set.lua) - Custom options (TokyoNight Storm colorscheme, relative line numbers, 2-space indentation).
  - [lua/joakim/lazy/](file:///Users/joakim/dotfiles/.config/nvim/lua/joakim/lazy/) - Modular plugin specs (Telescope, Neo-tree, blink.cmp, Treesitter, VimTeX, Lazygit, etc.).
- [.stow-local-ignore](file:///Users/joakim/dotfiles/.stow-local-ignore) - Files ignored by GNU Stow during installation.

---

## 🚀 Installation & Setup

These dotfiles are managed with **GNU Stow**. Stow creates symbolic links from your dotfiles directory (e.g., `~/dotfiles`) to your target home directory (`~`).

### 1. Install Prerequisites
You will need a few CLI packages. If you are on macOS, you can install them using [Homebrew](https://brew.sh/):

```bash
brew install stow tmux neovim lazygit pyenv tree
```

Make sure to install a **Nerd Font** (e.g., *MesloLGS NF* or *JetBrainsMono Nerd Font*) and configure your terminal to use it, so icons in Powerlevel10k and Neovim render correctly.

### 2. Install Oh My Zsh & Powerlevel10k
If you don't have Oh My Zsh or the Powerlevel10k theme installed:

```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 3. Clone and Stow
Clone this repository to your home directory, navigate to it, and use Stow to symlink the configurations:

```bash
cd ~
git clone https://github.com/JokkeIver/dotfiles.git
cd dotfiles
stow .
```

> [!NOTE]
> GNU Stow will symlink all files in the current folder (except those defined in `.stow-local-ignore`) into your parent directory (`~`). If you have existing files like `.zshrc` in `~`, you may need to back them up or delete them before running `stow .`.

### 4. Setup Tmux Plugins
After stowing, install the Tmux plugins via TPM:
1. Open a new terminal or reload your shell.
2. Start a Tmux session: `tmux`
3. Press `Ctrl + s` (the custom prefix key) followed by `I` (capital `i`) to install the configured plugins (Dracula and TPM).

---

## ⌨️ Custom Keybindings & Aliases

### 🐚 Zsh Aliases & Functions
A set of custom aliases and helper functions is defined in [.zshrc](file:///Users/joakim/dotfiles/.zshrc) for streamlined productivity:

| Command | Action |
| :--- | :--- |
| `lg` | Launch `lazygit` |
| `t` | Start a new `tmux` session |
| `ta <session>` | Attach to an existing `tmux` session |
| `ts <name>` | Create a new named `tmux` session |
| `tks <name>` | Kill a specific `tmux` session |
| `tka` | Kill all `tmux` sessions (`tmux kill-server`) |
| `files` | Run `tree -L1` to view directory structure |
| `ark <file>` | Archive a file by moving it to `~/Documents/04 - Arkiv/` |

#### 📂 PARA Method Shortcuts
Quick movements inside your PARA directory structure:
- `inbox` ➔ `cd ~/Documents/00 - Inbox/`
- `projekter` ➔ `cd ~/Documents/01 - Projekter/`
- `områder` ➔ `cd ~/Documents/02 - Områder/`
- `ressourcer` ➔ `cd ~/Documents/03 - Ressourcer/`
- `arkiv` ➔ `cd ~/Documents/04 - Arkiv/`

### 🪟 Tmux Navigation
- **Custom Prefix**: `Ctrl + s` (instead of `Ctrl + b`)
- **Vim-like pane navigation**:
  - `Prefix + h` ➔ Move left
  - `Prefix + j` ➔ Move down
  - `Prefix + k` ➔ Move up
  - `Prefix + l` ➔ Move right
- Top status bar displaying current battery status, working directory, git info, and ssh status.

### 📝 Neovim Keymaps
The Leader key is mapped to `<Space>`.

- `<leader>pv` ➔ Open file explorer (Netrw).
- `<Esc><Esc>` ➔ Clear search highlight (`:nohlsearch`).
- **Comment Box Bindings** (via [remap.lua](file:///Users/joakim/dotfiles/.config/nvim/lua/joakim/remap.lua)):
  - `<leader>cb` ➔ Create a centered box comment.
  - `<leader>ct` ➔ Create a title line comment.
  - `<leader>cl` ➔ Create a simple line comment.
  - `<leader>cm` ➔ Create a marked box comment.
  - `<leader>cd` ➔ Delete comment formatting.
