require 'fileutils'

task default: %w[update]

$symlinks = {
  '~/.ackrc': 'ackrc',
  '~/.gitignore': 'git/gitignore',
  '~/.gitconfig': 'git/gitconfig',
  '~/.vimrc': 'vim/vimrc',
  '~/.gvimrc': 'vim/gvimrc',
  '~/.tmux.conf': 'tmux.conf',
  '~/.config/fish/fishfile': 'config/fish/fishfile',
  '~/.config/fish/config.fish': 'config/fish/config.fish',
  '~/.config/fish/conf.d/rust.fish': 'config/fish/conf.d/rust.fish'
}

desc 'Install basic setup'
task :install do
  # Install homebrew
  system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')

  # Install everything in Brewfile
  system('brew tap homebrew/bundle')
  system('brew bundle')
  
  # Install vim-plug and install plugins
  system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  system('vim -c ":PlugInstall|q|q"')

  # Install fisher and plugins
  system('curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish')
  system('fisher add jethrokuan/fzf jethrokuan/z jorgebucaran/fish-nvm laughedelic/pisces rafaelrinaldi/pure')

  update
end

desc 'Install or Update dotfile repositories and files.'
task :update do
  update
end

def update
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

