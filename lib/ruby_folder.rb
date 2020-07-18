
def dir_name
  puts "Quel nom voulez-vous pour votre dossier ?"
  print "> "

  return folder_name = gets.chomp
end

def create_dir(folder_name)
  Dir.mkdir(folder_name)
  puts "==> Le dossier #{folder_name} a été créé"
end

def create_gemfile(folder_name)
  fname = "#{folder_name}/Gemfile"
  gemfile_content = [
    "source \"https://rubygems.org\"",  
    "ruby '2.7.0'",  
    "gem 'rspec'",  
    "gem 'pry'",  
    "gem 'rubocop', '~> 0.57.2'",  
    "gem 'dotenv'"
  ]

  somefile = File.open(fname, "w")
  somefile.puts gemfile_content.each { |s| s + "\n"}
  somefile.close
  
  puts "==> Le fichier Gemfile a été créé."
end

def bundle(folder_name) 
  system "cd #{folder_name} && bundle install"
  puts "==> Les gems sont installées."
end

def rspec_init(folder_name)
  system "cd #{folder_name} && rspec --init"
  puts "==> Rspec est initialisé."
end

def git_init(folder_name)
  system "cd #{folder_name} && git init"
  puts "==> git est initialisé."
end

def mk_lib(folder_name)
  system "cd #{folder_name} && mkdir lib"
  puts "==> Le dossier lib est créé."
end

def create_files(folder_name)
  system "touch #{folder_name}/.env"
  system "touch #{folder_name}/README.md"
  system "touch #{folder_name}/lib/app.rb"
  system "touch #{folder_name}/spec/app_spec.rb"
  puts "==> Les fichiers sont créés."
end

def gitignore(folder_name)
  fname = "#{folder_name}/.gitignore"
  somefile = File.open(fname, "w")
  somefile.puts ".env"
  somefile.close
  puts "==> .env a été mis dans le .gitignore"
end


def perform
  folder_name = dir_name()
  create_dir(folder_name)
  create_gemfile(folder_name)
  bundle(folder_name)
  rspec_init(folder_name)
  git_init(folder_name)
  mk_lib(folder_name)
  create_files(folder_name)
  gitignore(folder_name)
end

perform

