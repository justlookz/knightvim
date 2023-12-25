# Suggestions

If by any mean you see this github by searching through and need a configuration, I highly suggest to use LazyVim or AstroNvim or fork kickstart

# Installation 

for linux the command for cloning and using knightvim is 

```bash
git clone --depth 1 https://github.com/justlookz/knightvim ~/.config/nvim
```

need git and neovim

if nvim configs already exists, dont forget to remove them first after a backup if needed

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

```bash
rm -rf ~/.config/nvim
```

for apt 

```bash
sudo apt update && sudo apt install git neovim
```

for windows 

need packages from winget (windows store)
```powershell
winget install -e --id LLVM.LLVM;winget install -e --id Neovim.Neovim.Nightly;winget install -e --id Git.Git
```

and clone it

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
alias kvim='$NVIM_APPNAME="name-of-folder nvim"
```

replace name-of-folder with whatever name

```bash
alias kvim='$NVIM_APPNAME="kvim nvim"
```


# Disclamer
This is my personal configuration. 
Use it at your own risk. 
