## Doug Does Dotfiles

A few dotfiles. Current OS of choice is elementaryOS.

### Usage
```bash
cd $HOME
git clone https://github.com/dkbarrett/dotfiles
cd dotfiles
sudo ./install
```

### Directory Structure
```bash
.
├── /bin               # Directory for any scripts
├── /files             # Dotfiles to be transferred to $HOME directory 
│   ├── .aliases       # Custom aliases
│   ├── .bash_profile  # Script run prior to each bash session
│   ├── .exports       # Environment variables
│   └── .functions     # Custom bash functions
├── install            # Installation script
├── /packages          # Directory containing files that have a list of packages to install
│   ├── atom           # List of atom plugins to be installed via apm
│   └── system         # List of packages to be installed via apt-get
└── README.md          # This readme file
```
