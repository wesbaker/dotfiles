require 'fileutils'

task default: %w[update]

$symlinks = {
  '~/.ackrc': 'ackrc',
  '~/.gitignore': 'git/gitignore',
  '~/.gitconfig': 'git/gitconfig',
  '~/.vimrc': 'vim/vimrc',
  '~/.gvimrc': 'vim/gvimrc',
  '~/.tmux.conf': 'tmux.conf',
  '~/.config/fish/fish_plugins': 'config/fish/fish_plugins',
  '~/.config/fish/config.fish': 'config/fish/config.fish',
  '~/.config/fish/conf.d/rust.fish': 'config/fish/conf.d/rust.fish',
  '~/.config/fish/conf.d/chruby.fish': 'config/fish/conf.d/chruby.fish',
  '~/.config/fish/conf.d/fnm.fish': 'config/fish/conf.d/fnm.fish',
  '~/.config/fish/conf.d/bobthefish.fish': 'config/fish/conf.d/bobthefish.fish'
}

desc 'Install basic setup'
task :install do
  create_directories
  create_symlinks

  # Install homebrew
  system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')

  # Install everything in Brewfile
  system('brew bundle')

  # Install vim-plug and install plugins
  system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  system('vim -c ":PlugInstall|q|q"')

  # Install fisher and plugins
  system('curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher')
  system('fisher') # Plugins are listed in fish_plugins

  # Install LTS version of Node.js
  system('fnm install --lts')
end

desc 'Install or Update dotfile repositories and files.'
task :update do
  create_symlinks
end

def create_directories
  FileUtils.mkdir_p '~/.config/fish/conf.d/'
end

def create_symlinks
  $symlinks.each do |symlink, path|
    symlink = File.expand_path(symlink.to_s)
    path    = File.expand_path(path)

    File.delete(symlink) if File.symlink?(symlink)
    File.symlink(path, symlink)
  end
end

desc 'Remove all installed dotfile repositories and files.'
task :uninstall do
  $symlinks.each do |symlink, _path|
    symlink = File.expand_path(symlink.to_s)
    File.delete(symlink) if File.symlink?(symlink)
  end
end

desc 'Remove all existing dotfiles (symlinks or files)'
task :clear do
  $symlinks.each do |destination, _|
    destination = File.expand_path(destination.to_s)
    File.delete(destination)
  end
end

