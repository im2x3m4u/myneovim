# README

<h3 align="center">
Excellent Neovim Configuration
</h3>

<h4 align="center" style="font-size:0.7rem;font-weight:600;">
For Linux
</h4>

<h4 align="center">
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" style="max-width: 100%;" width="400">
</h4>

<h3 align="center">
<img src="./resource/2022-12-01_15-59.png" width=80%/>
</h3>

<h3 align="center">
<img src="https://img.shields.io/badge/neovim-0.8.1-green?style=for-the-badge&logo=neovim&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41" />
<img src="https://img.shields.io/badge/platform-linux-green?style=for-the-badge&logo=flickr&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41" />
<img src="https://img.shields.io/github/stars/askfiy/nvim?style=for-the-badge&logo=github&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41" />
<img src="https://img.shields.io/github/issues/askfiy/nvim?style=for-the-badge&logo=gitbook&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41" />
</h3>

## Introduction

Based on the configuration of the `Nvim 0.8.1` version, it aims to make an out-of-the-box and full-featured code editor.

advantage:

- Fast boot (60ms to complete the boot, the test environment is i5-12500H + 16G DDR5)
- Customizability (completely transparent configuration, build your own IDE in your own way)
- Extensibility (customization via various community-driven plugins with many pre-made features)

## Install

Clone this repository:

```
git clone https://github.com/askfiy/nvim ~/.config
```

Install dependencies (according to your preferences):

```
-- if you want to use the system clipboard
$ yay -s xsel

-- if yo want use lazygit in nvim
$ yay -s lazygit

-- if you want have good syntax highlighting in nvim
$ yay -s tree-sitter

-- if you want convenient fuzzy search in nvim
$ yay -s fd sed ripgrep

-- if you want use translation in nvim
$ yay -s translate-shell

-- if you want to put files deleted in nvim into recycle bin
$ yay -s trash-cli

-- if you want to link the mysql in nvim
$ yay -s percona-server-clients

-- if you use python pylint diagnostic code and write django
$ pip3 install pylint-django

-- if you use python pyright diagnostic code and write django
$ pip3 install django-stubs

-- if you want use tabline in nvim
$ yay -s unzip curl

-- if you want preview markdown to browser in nvim
$ yay -s pandoc
$ npm i -g live-server

-- if you want to quickly upload images to the internet and generate markdown links
$ npm i -g picgo

-- if you want to store dd and yy data persistently
$ yay -S sqlite3
```

## Use

Open the [settings.lua](./lua/core/setting.lua) file to adjust Nvim's configuration functions.

Open the [options.lua](./lua/core/options.lua) file and set your personal preferences.

Open the [mapping.lua](./lua/core/mapping.lua) file to set the base keys.

Open the [lua/utils/public/icons.lua](./lua/utils/public/icons.lua) file to change the icons to your liking.

Open the [mason.lua](./lua/config/basic/mason.lua) file and add the `LSP`, `DAP`, `Linter`, `Formatter` and other external tools you need .

If you want to customize the startup configuration of a certain `LSP`, you should configure it in [lua/config/lsp/server_configurations](./lua/config/lsp/server_configurations) directory.

If you want to customize the startup configuration of a `DAP`, you should do this in [lua/config/dap/dap_configurations](./lua/config/dap/dap_configurations) directory to create configuration files.

You can change anything you don't like, and if you don't know how to change it, you can file an ISSUE.

## Some command

```
- PackerSync      : Update plugin
- LspInfo         : View LSP server running status
- Mason           : External program management
- VsnipOpen       : Open a user-defined snippet
- MarkdownPreview : Preview markdown file
- TSUpdate all    : Update tree-sitter parser
- MakeDirectory   : Create directory if it doesn't exist
```
