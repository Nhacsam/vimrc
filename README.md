![VIM](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/220px-Vimlogo.svg.png)

# The Ultimate vimrc

Welcome to my awesome vim/neovim configuration. You will find there everything you need for everyday development with vim or neovim.

This configuration is based and inspired by [the amix one](https://github.com/amix/vimrc). Thanks to him !!

All plugins and options are optimized for Javascript and PHP development. 



## Basic Installation


The basic installation includes the most essentials plugins and the easiest to install.
To install it simply do following from your terminal:

    git clone --recursive https://github.com/nhacsam/vimrc.git ~/.vim_runtime
    cd ~/.vim_runtime
    sh scripts/install.sh

### Activate the global search

To be able to search in all files with `,g` the ack.vim plugin need `ack` or `ag`.

To install it, type the following in a terminal

#### On MacOS

    brew install the_silver_searcher

#### On Ubuntu

    sudo apt-get install ack-grep

#### On other platforms

https://github.com/ggreer/the_silver_searcher


### Autocompletion

To enabled autocompletion for javasctipt and flow, you need to install the langageServer associated :

    npm i -g flow-language-server
    npm i -g javascript-typescript-langserver

To install autocompletion for other language, the following site gives you the plugin you will have to install : https://langserver.org/

To will also  need to have Vim > 8 or neovim to make the autocompletion works.

If you are using vim 8, you will maybe have the follong error :

```
[vim-hug-neovim-rpc] Vim(pythonx):Traceback (most recent call last):
```

To make it works, you need the `neovim` python package

    pip3 install neovim
    # If needed, launch it with sudo
    # sudo pip3 install neovim


### Installing vim 8

On MacOS

    brew install vim

On Ubuntu:

```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

### Installing neovim

Follow the guide : https://github.com/neovim/neovim/wiki/Installing-Neovim

Don't forgot to launch `:healthchecks` in neovim to be sure everything is installed correctly


### Colors

The repostory includes everything you need to have the same colors on your terminal, vim, fzf, tmux, ... Awesome !!!

To do it, edit your `.bashrc`, `.bash_profile` or `.zshrc` to add the following lines :

    # Base16 Shell
    BASE16_SHELL="$HOME/.vim_runtime/misc/base16-shell"
    [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] &&  eval "$("$BASE16_SHELL/profile_helper.sh")"

    base16_monokai
    source ~/.vim_runtime/misc/base16-fzf/bash/base16-monokai.config


All the colors scheme visibles here are available : http://chriskempson.com/projects/base16/

For example, if `base16-material-darker` looks find for you, you can try it with the following command : 

    base16_material-darker

If it looks fine for you, you can then remplace `monokai` by `material-darker` in your `.bashrc`


## Some screenshots

TODO


## Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your vim runtimepath 

Features :

* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for `the_silver_searcher` (ag) or ack -- a wicked fast grep
* [ale](https://github.com/w0rp/ale): Syntax and lint checking for vim (async)
* [fzf](https://github.com/junegunn/fzf.vim): A fast way to search by filename, in buffers, commits, history, ...
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin): A plugin of NERDTree showing git status 
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [Tabular](https://github.com/godlygeek/tabular): Line up text with tabs
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  
* [vim-expand-region](https://github.com/terryma/vim-expand-region): Allows you to visually select increasingly larger regions of text using the same key combination
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Sublime Text style multiple selections for Vim with CTRL+N 
* [vim-surround](https://github.com/tpope/vim-surround): The plugin provides mappings to easily delete, change and add parentheses, brackets, quotes, XML tags, and more.

Completion :

* [deoplete.nvim](https://github.com/Shougo/deoplete.nvim): Dark powered asynchronous completion framework for neovim/Vim8
* [LanguageClient-neovim](https://github.com/autozimu/LanguageClient-neovim): Language Server Protocol (LSP) support for vim and neovim. Install all language autocompletion you need
* [ultisnips](https://github.com/SirVer/ultisnips): UltiSnips - The ultimate snippet solution for Vim.


Interface :

* [goyo.vim](https://github.com/junegunn/goyo.vim): Trigger a very light interface with `,z` to remove distractions
* [vim-airline](https://github.com/vim-airline/vim-airline): A beautiful status/tabline 
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter): A Vim plugin which shows a git diff in the 'gutter' (sign column).

## How to include your own stuff?

After you have installed the setup, you can create **~/.vim_runtime/my_configs.vim** to fill in any configurations that are important for you. For instance, my **my_configs.vim** looks like this:

    let g:python_host_prog = '/Users/nhacsam/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = '/Users/nhacsam/.pyenv/versions/neovim3/bin/python'

You can also install your plugins, for instance, via pathogen you can install [vim-rails](https://github.com/tpope/vim-rails):

    cd ~/.vim_runtime
    git clone git://github.com/tpope/vim-rails.git my_plugins/vim-rails



## Standards 

  - :mag: View typing errors (ALE)
    - Javascript :white_check_mark:
      - `eslint` and `flow`
    - PHP :white_check_mark:
      - `phpcs`
  - :art: Automatic formatting (ALE)
    - javascript :white_check_mark:
      - `prettier` and `eslint` on save
    - php :white_check_mark:
      - `php_cs_fixer` on save
  - :bug: Debug :x:
  - :package: See the list of outdated dependencies :x:
  - :octocat: See git changes
    - See the live added, edited and removed in the editor :white_check_mark:
    - See the file changed in the file system :white_check_mark: (nerdtree-git-plugin)
    - See the diff of the current file :white_check_mark: (`,d`)
  - :zap: Use Snippets :white_check_mark: (UltiSnips)
  - :spiral_notepad: Autocomplete
    - Javascript :white_check_mark:
    - PHP :white_check_mark:
    - Relative path :white_check_mark:
    - Absolute path :x:
    - Other tools :warning: (naïve autocompletion)
  - :book: See the function documentation
    -  PHP :white_check_mark: (`K`)
    - Javascript and PHP :warning: (`K`)
       - partial: use flowtype definition
  - :arrow_right: Go to the definition
    - Javascript :warning: (`gd`)
       - partial: Go the import at the top of the file
    - Go to file :white_check_mark: (`gf`)
    - Go to file in javascript absolute import :partial: (`,f` to open a search with the file name)

## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.

### Plugin related mappings

Open [FZF Buffer](https://github.com/junegunn/fzf.vim) to see and manage the current buffers (`;`):

    map ; :Buffer<cr>

Open [FZF File](https://github.com/kien/ctrlp.vim) plugin to quickly find a file versionned by git or in all folders (`<leader>j` or `<ctrl>J`):

    map <leader>j :GitFiles<cr>
    map <leader>J :Files<cr>

[NERD Tree](https://github.com/scrooloose/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

[goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2) lets you only focus on one thing at a time. It removes all the distractions and centers the content. It has a special look when editing Markdown, reStructuredText and textfiles. It only has one mapping. (`<leader>z`)

    map <leader>z :Goyo<cr>


### Comment lines

Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines.

[See more](https://github.com/tpope/vim-commentary)

### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w!<cr>
	
Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>x` )
	
    " Close current buffer
    map <leader>x :Bclose<cr>:tabclose<cr>gT
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


Surround the visual selection in parenthesis/brackets/etc. with `s`

Press `+` to expand the visual selection and `_` to shrink it.

### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special characters:

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

