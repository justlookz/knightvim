# Suggestions

If by any mean you see this github by searching through and need a configuration, I highly suggest to use LazyVim or AstroNvim or fork kickstart

# Installation 

for linux the command for cloning and using knightvim is 

```bash
cd ~/.config/
git clone --depth 1 https://github.com/justlookz/knightvim ~/.config/nvim
```

need git and neovim 

for apt 

```bash
sudo apt upgrade && sudo apt install git neovim
```

for windows 

need packages from winget (windows store)
```powershell
winget install -e --id LLVM.LLVM;winget install -e --id Neovim.Neovim.Nightly;winget install -e --id Git.Git
```

```powershell
git clone --depth 1 https://github.com/justlookz/knightvim $env:LOCALAPPDATA\nvim
nvim

```



replace nvim for other name if wanted to use with
```text
$NVIM_APPNAME
```
by creating an alias
```bash
alias kvim='$NVIM_APPNAME="/name-of-folder kvim"
```
replace name-of-folder with whatever name 


# Disclamer
This is my personal configuration. 
Use it at your own risk. 
