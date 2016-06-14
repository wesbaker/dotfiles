require 'fileutils'

task default: %w[update]

symlinks = {
  '~/.ackrc': 'ackrc',
  '~/.gitignore': 'git/gitignore',
  '~/.gitconfig': 'git/gitconfig',
  '~/.vim': 'vim/vim',
  '~/.vimrc': 'vim/vimrc',
  '~/.gvimrc': 'vim/gvimrc'
}

desc 'Install or Update dotfile repositories and files.'
task :update do
  symlinks.each do |symlink, path|
    symlink = File.expand_path(symlink.to_s)
    path    = File.expand_path(path)

    File.delete(symlink) if File.symlink?(symlink)
    File.symlink(path, symlink)
  end
end

desc 'Remove all installed dotfile repositories and files.'
task :uninstall do
  repositories.each do |path, _url|
    FileUtils.rm_rf(File.expand_path(path.to_s))
  end

  symlinks.each do |symlink, _path|
    symlink = File.expand_path(symlink.to_s)
    File.delete(symlink) if File.symlink?(symlink)
  end
end
