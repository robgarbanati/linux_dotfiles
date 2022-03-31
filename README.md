Installation
============
```
➜  make packages: sudo apt install [packages list]
➜  make neovim: install and set up nvim
➜  make get-pip: download get-pip.py for python3
➜  make install-pip: install pip for python3

<!-- all                            Make it all! -->
<!-- brew                           Ensure only formulas in Brewfile are installed -->
<!-- ensure_symlinks                Symlink files to where they belong -->
<!-- pip                            Ensure only pip packages in requirements.in are installed -->
<!-- sleepwatcher                   Link sleepwatcher user launch agent -->
<!-- ``` -->
<!--  -->
<!-- ``` -->
<!-- ➜  dotfiles git:(master) make all -->
<!-- ./ensure_symlinks.sh -->
<!-- brew update -->
<!-- Already up-to-date. -->
<!-- brew doctor -->
<!-- Your system is ready to brew. -->
<!-- brew bundle cleanup --force -->
<!-- brew bundle check || brew bundle -->
<!-- The Brewfile's dependencies are satisfied. -->
<!-- brew bundle dump --force -->
<!-- pip freeze | xargs pip uninstall -y -q -->
<!-- pip install -r requirements.in --upgrade -q -->
<!-- pip freeze -r requirements.in > requirements.txt -->
```
nvim --version should be at least 0.6.1
in an nvim window, type :PluginInstall
