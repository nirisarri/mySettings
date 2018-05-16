
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-a4faccd\src\posh-git.psd1'

pushd 'C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools'    
cmd /c "vsvars32.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd
write-host "`nVisual Studio 2015 Command Prompt variables set." -ForegroundColor Yellow