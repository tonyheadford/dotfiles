require 'rake'

desc "Install files and set up"
task :install do
  files = Dir['*'] - %w[Rakefile README.md]
  files.each do |file|
    link_file(file)
  end
  install_vundle
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

