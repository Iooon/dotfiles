# Config file targets
- bash
- vim
- nvim (v0.5+)
- tmux

# General
```
ln -s /path/to/original /path/to/link 
```

# Setup nvim
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then run :PackerSync or nvim +PackerSync
Check language servers with: :Mason
