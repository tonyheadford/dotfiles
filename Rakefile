require 'rake'

desc "Install files and set up"
task :install do
  files = Dir['*'] - %w[Rakefile README.md]
  files.each do |file|
    link_file(file)
  end
  install_vundle
  install_gitignore
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}" }
end

def install_vundle
  puts "installing vundle"
  system %Q{git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle}
  system %Q{vim +BundleInstall +qall}
end

def install_gitignore
  puts "adding global gitignore"
  system %Q{git config --global core.excludesfile $HOME/.gitignore_global}
end

