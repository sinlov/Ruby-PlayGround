# this is env printer
class EnvPrinter

  # print now info of system
  def print_now_info_system
    puts "ENV['RUBYLIB'] => #{ENV['RUBYLIB']}" # the RUBYLIB search path
    puts "ENV['RUBYLIB_PREFIX'] => #{ENV['RUBYLIB_PREFIX']}" # Mangle the RUBYLIB search path by adding this prefix to each component.
    puts "ENV['LOGDIR'] => #{ENV['LOGDIR']}" # Fallback pointer to the user’s home directory if $HOME is not set. Used only by Dir.chdir.
    puts "ENV['OPENSSL_CONF'] => #{ENV['OPENSSL_CONF']}" # local user profile for openssl
    puts "ENV['RUBYOPT'] => #{ENV['RUBYOPT']}" # Check after the command-line options are parsed, ($SAFE must set 0)
    puts "ENV['RUBYPATH'] => #{ENV['RUBYPATH']}" # -S ruby search path, default is $PATH
    puts "ENV['RUBYSHELL'] => #{ENV['RUBYSHELL']}" # Shell to use when spawning a process under Windows; if not set, will also check SHELL or COMSPEC.
    puts "ENV['RUBY_TCL_DLL'] => #{ENV['RUBY_TCL_DLL']}" # Override default name for TCL shared library or DLL.
    puts "ENV['RUBY_TK_DLL'] => #{ENV['RUBY_TK_DLL']}" # Override default name for Tk shared library or DLL. Both this and RUBY_TCL_DLL must be set for either to be used.
    puts "ENV['DLN_LIBRARY_PATH'] => #{ENV['DLN_LIBRARY_PATH']}" # path used to search for modules that are dynamically loaded
    puts "ENV['HOME'] => #{ENV['HOME']}" # the user's home directory
    puts "ENV['USER'] => #{ENV['USER']}" # the name of user
    puts "ENV['SHELL'] => #{ENV['SHELL']}" # now used shell, same as echo $SHELL
  end
end