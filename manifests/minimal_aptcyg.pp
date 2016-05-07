class cygwin_common::minimal_aptcyg{
  if ($operatingsystem == 'windows') {
      $cygwinroot = get_cygwin_root()
      if ($cygwinroot) {
          $sysroot = env("SYSTEMROOT")
          $sys32 = file_join_win(["${sysroot}", "System32"])
          $cygwin_vendor = file_join_win(["${cygwinroot}", "vendor"])
          $cygwin_aptcyg = file_join_win(["${cygwin_vendor}", "apt-cyg"])
          $cygwin_bin = file_join_win(["${cygwinroot}", "bin"])
          class {'cygwin_apt_cyg': } ->
          exec {'apt-cyg_install_minimal':
            path => ["$sysroot", "$sys32", "${cygwin_bin}", ],
            cwd => "${cygwin_bin}",
            command => 'bash.exe -c "/usr/local/bin/apt-cyg install wget vim screen git openssh telnet; exit 0"',
          }
      } else {
          notify {"cygwin root does not exist": }
      }
  } else {
      notify {"$operatingsystem is not supported": }
  }
}
