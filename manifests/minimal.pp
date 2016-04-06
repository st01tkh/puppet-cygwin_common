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
      $choco_cyg_get_exec = file_join_win(["${choco_cyg_get_tools}", "cyg-get.ps1"])
      notify { "choco_cyg_get_tools: ${choco_cyg_get_tools}": }
      exec {'cyg_get_vim_screen_git_openssh':
        path => ["$sysroot", "$sys32", "${choco_bin}", "${choco_cyg_get_tools}", ],
        provider => powershell,
        cwd => "${choco_cyg_get_tools}",
        command => 'cyg-get.ps1 vim,screen,git,openssh',
      }
    }
  } else {
      notify {"$operatingsystem is not supported": }
  }
}
