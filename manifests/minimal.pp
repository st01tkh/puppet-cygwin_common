class cygwin_common::minimal{
  if ($operatingsystem == 'windows') {
    $cygwinroot = get_cygwin_root()
    if ($cygwinroot) {
      $sysdrv = env("SYSTEMDRIVE")
      $sysroot = env("SYSTEMROOT")
      $sys32 = file_join_win(["${sysroot}", "System32"])
      $chocoroot = env("chocolateyInstall")
      $choco_bin = file_join_win(["${chocoroot}", "bin"])
      $choco_lib = file_join_win(["${chocoroot}", "lib"])
      $choco_cyg_get= file_join_win(["${choco_lib}", "cyg-get"])
      $choco_cyg_get_tools = file_join_win(["${choco_cyg_get}", "tools"])
      $choco_cyg_get = file_join_win(["${choco_cyg_get_tools}", "cyg-get.ps1"])
      exec {'cyg_get_vim':
        path => ["$sysroot", "$sys32", "${choco_bin}", "${choco_cyg_get_tools}, ],
        command => 'cyg-get.bat vim',
      }
    }
  } else {
      notify {"$operatingsystem is not supported": }
  }
}
