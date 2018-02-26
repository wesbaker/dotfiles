require 'fileutils'

task default: %w[update]

$symlinks = {
  '~/.ackrc': 'ackrc',
  '~/.gitignore': 'git/gitignore',
  '~/.gitconfig': 'git/gitconfig',
  '~/.vim': 'vim/vim',
  '~/.vimrc': 'vim/vimrc',
  '~/.gvimrc': 'vim/gvimrc'
}

desc 'Install basic setup'
task :install do
  system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
  system('brew tap homebrew/bundle')
  system('brew bundle')
  system('git submodule init')
  system('git submodule update')
  system('curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher')
  system('fisher install fzf z nitro fnm')
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

