# NvChad Neovim Configuration

This is a customized Neovim configuration built on top of the NvChad framework, featuring AI-powered development tools, enhanced keybindings, and support for modern web development.

## Architecture Overview

This configuration uses:
- **NvChad v2.5** as the base framework
- **Lazy.nvim** for plugin management
- **Base46** for theming system
- **Lua** for all configuration files

## Key Features

### 🤖 AI Integration
- **CodeCompanion**: Full AI assistance with Anthropic Claude integration
- **Parrot**: Alternative AI provider with multiple model support
- Both plugins use the `ANTHROPIC_API_KEY` environment variable

### 🎨 Theme & UI
- **Tokyo Night** theme (`lua/chadrc.lua:9`)
- **Base46** theming system with cached themes for performance
- Custom statusline configuration

### 📁 File Structure
```
~/.config/nvim/
├── init.lua              # Main entry point
├── lua/
│   ├── chadrc.lua        # NvChad configuration
│   ├── options.lua       # Vim options
│   ├── mappings.lua      # Key mappings
│   ├── configs/          # Plugin configurations
│   │   ├── conform.lua   # Code formatting
│   │   ├── lazy.lua      # Plugin manager settings
│   │   └── lspconfig.lua # LSP configurations
│   └── plugins/
│       └── init.lua      # Plugin definitions
├── package.json          # MDX language server dependency
└── lazy-lock.json        # Plugin version lock file
```

## Plugin Configuration

### Core Plugins
- **nvim-treesitter**: Syntax highlighting for vim, lua, html, css, and mdx
- **nvim-lspconfig**: LSP support for HTML and CSS
- **conform.nvim**: Code formatting with stylua and prettier
- **blink.cmp**: Completion framework with CodeCompanion integration

### AI Plugins
1. **CodeCompanion** (`lua/plugins/init.lua:83-104`)
   - Primary AI assistant
   - Anthropic Claude integration
   - Inline, chat, and command strategies

2. **Parrot** (`lua/plugins/init.lua:47-80`)
   - Alternative AI provider
   - Multiple Claude models support
   - FZF integration for model selection

### Development Tools
- **vim-astro**: Astro framework support
- **MDX support**: Custom filetype detection and treesitter integration
- **@mdx-js/language-server**: MDX language server via Node.js
- **Go support**: gopls LSP with goimports/gofmt formatting

## Key Bindings

### AI Assistant Keybindings
- `<C-a>`: CodeCompanion actions (normal/visual)
- `<LocalLeader>a`: Toggle CodeCompanion chat
- `ga`: Add selection to CodeCompanion chat (visual)
- `:cc`: Expands to `:CodeCompanion`

### Custom Keybindings
- `<C-j>/<C-k>`: Move selected lines up/down (visual mode)
- `<M-BS>`: Delete word in insert mode (macOS Option+Backspace)
- `<C-u>/<C-r>`: Undo/redo in insert mode
- `<leader>ss`: Save session to `./vim-session.vim`
- `<leader>rs`: Restore session from `./vim-session.vim`

### Standard Mappings
- `jk`: Escape to normal mode
- `;`: Enter command mode
- Space: Leader key

## Development Workflow

### Code Formatting
Automatic formatting configured for:
- **Lua**: stylua
- **CSS/HTML**: prettier
- **Go**: goimports + gofmt
- Format on save with 500ms timeout and LSP fallback

### Session Management
Local project sessions:
```lua
-- Save session
<leader>ss

-- Restore session  
<leader>rs
```

### LSP Integration
- HTML, CSS, and Go language servers enabled
- gopls for Go development with full language support
- Blink completion with CodeCompanion source integration
- Treesitter-based syntax highlighting

## Environment Setup

### Required Environment Variables
```bash
export ANTHROPIC_API_KEY="your-api-key-here"
```

### Dependencies
- **Node.js**: Required for MDX language server
- **Git**: For plugin management via Lazy.nvim
- **stylua**: Lua code formatting
- **prettier**: Web development formatting

## Performance Optimizations

### Lazy Loading
- Most plugins load lazily via Lazy.nvim
- Base46 theme caching for faster startup
- Disabled unnecessary vim plugins (`lua/configs/lazy.lua:16-44`)

### Plugin Management
- Version locking via `lazy-lock.json`
- Automatic plugin installation on first run
- Performance-optimized plugin loading

## Common Commands

### AI Assistance
```vim
:CodeCompanion          " Open AI assistant
:CodeCompanionActions   " Show available AI actions
:CodeCompanionChat      " Toggle chat interface
```

### Development
```vim
:Lazy                   " Manage plugins
:LspInfo               " Check LSP status
:ConformInfo           " Check formatting status
```

## File Type Support

- **Lua**: Full LSP and formatting
- **HTML/CSS**: LSP and prettier formatting  
- **MDX**: Custom filetype with markdown treesitter
- **Astro**: Syntax highlighting and basic support
- **JavaScript/TypeScript**: Basic treesitter support

## Customization

### Adding New Plugins
Add to `lua/plugins/init.lua`:
```lua
{
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

### Custom Keybindings
Add to `lua/mappings.lua`:
```lua
local map = vim.keymap.set
map("n", "<key>", "<command>", { desc = "Description" })
```

### Theme Customization
Modify `lua/chadrc.lua`:
```lua
M.base46 = {
  theme = "your-theme-name",
  hl_override = {
    -- Custom highlights
  },
}
```

This configuration provides a modern, AI-enhanced Neovim setup optimized for web development and general programming tasks.