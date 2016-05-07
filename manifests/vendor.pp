class cygwin_common::vendor {
  if ($operatingsystem == 'windows') {
      $cygwinroot = get_cygwin_root()
      if ($cygwinroot) {
          $sysroot = env("SYSTEMROOT")
          $sys32 = file_join_win(["${sysroot}", "System32"])
          $cygwin_vendor = file_join_win(["${cygwinroot}", "vendor"])
          file {"${cygwin_vendor}": ensure => 'directory' }
      } else {
          notify {"cygwin root does not exist": }
      }
  } else {
      notify {"$operatingsystem is not supported": }
  }
}
