class cygwin_common::minimal{
  if ($operatingsystem == 'windows') {
    $cygwinroot = get_cygwin_root()
    if ($cygwinroot) {
      $sysdrv = env("SYSTEMDRIVE")
      $sysroot = env("SYSTEMROOT")
      $sys32 = file_join_win(["${sysroot}", "System32"])
      $cygwin_bin = file_join_win(["${cygwinroot}", "bin"])
      $cygwin_etc = file_join_win(["${cygwinroot}", "etc"])
      $cygwin_etc_profile_d = file_join_win(["${cygwin_etc}", "profile.d"])
      $cygwin_etc_profile_d_path = file_join_win(["${cygwin_etc_profile_d}", "path.sh"])
      notify {"System Drive: ${sysdrv}; CygWin root: ${cygwinroot}; CygWin common bashrc: ${cygwin_comn_bashrc}": }
      file {"${cygwin_etc_profile_d}":
        ensure => directory,
      } -> 
      file {"${cygwin_etc_profile_d_path}":
        ensure => present,
        source_permissions => ignore,
        source => "puppet:///modules/cygwin_common/etc/profile.d/path.sh",
      }
      #file_line { 'cygwin_comn_bashrc_common_path':
      #  path => "${cygwin_comn_bashrc}",
      #  line => 'export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
      #}
    }
  } else {
      notify {"$operatingsystem is not supported": }
  }
}
