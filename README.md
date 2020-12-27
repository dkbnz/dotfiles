# Doug Does Dotfiles

Dotfiles are text-based configuration files that store settings of various programs used on unix-like systems. These files are usually stored in the user's $HOME directory and prepended with a dot, which indicates to the system that they are supposed to be hidden. Hence the name 'dotfiles'.

The advantage of version controlling these are numerous. It allows the user to access a new machine, whether local or remote, and have all of their themes, shortcuts and settings applied within seconds.

## Usage
```bash
$ cd $HOME
$ git clone https://github.com/dkbarrett/dotfiles
$ cd dotfiles
$ ./install --help
usage: install [OPTIONS]
-l | --link      Link dotfiles to home directory
-s | --server    Install server packages  (Root required)
-d | --desktop   Install desktop packages (Root required)
-h | --help      Show this help message
```

### `-l | --link`

All files in the `src/` directory will be symlinked to their corresponding location in the user's `$HOME` directory. Existing files will have a `~` prepended to their filename as a means of backup. If a target file in the `$HOME` directory is a link, it will be overwritten by the new link.

### `-s | --server`

 Install packages in `server_packages` using apt. These are mainly tools needed for basic server administration and support some of the user defined bash functions in `src/.functions`

### `-d | --desktop`

 Install packages in `desktop_packages` using apt. Used with a fresh install.

## Dot Functions

Some functions defined in `src/.functions` are for the management of these dotfiles.
- `dot DOTFILES...`: Add specified file(s) to version control. This will move the file(s) to the `src/` directory, preserving the directory structure from the user's `$HOME` directory. File(s) will then be symlinked back to maintain functionality.
- `updot`: Pull the latest dotfiles, update links and source `~/.bashrc` to use the latest changes.
- `endot`: Create a tar of all files in `src_sensitive` and encrypt them using gpg. Resulting file is `encrypted.tar.gz.gpg`
- `dedot`: Perform the inverse of `endot`, provided the user has the required private key.

## Notes

As this repo is for my personal use, there are some configurations that are user specific. If the number of these instances grow, I may collate them into a single 'user' file. For now, if you would like to fork/use this repo, I suggest you edit the following files:
 - `src/.functions`: the encryption key for `endot`
 - `src/.gitconfig`: the global `user.name` and `user.email`
