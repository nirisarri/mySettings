#Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Import-Module z
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Get-ChildItemColor
#
# Set-Theme Paradox
# Set-PoshPrompt -Theme PowerLine
Set-PoshPrompt C:\Users\NicolasD\.poshthemes\nicpowerline.omp.json
#
Set-Alias l Get-ChildItemColor -Option AllScope
Set-Alias ll Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope
#
Set-alias dc docker-compose.exe
Set-alias d docker.exe
Set-alias dn dotnet.exe
Set-alias k kubectl.exe
Set-Alias mup multipass.exe

$DefaultUser = 'nicolasd'
#function Prompt {
#	Update-NavigationHistory $pwd.Path
#}
#
## Chocolatey profile
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path($ChocolateyProfile)) {
#  Import-Module "$ChocolateyProfile"
#}
function U {
    param
    (
        [int] $Code
    )
 
    if ((0 -le $Code) -and ($Code -le 0xFFFF)) {
        return [char] $Code
    }
 
    if ((0x10000 -le $Code) -and ($Code -le 0x10FFFF)) {
        return [char]::ConvertFromUtf32($Code)
    }
 
    throw "Invalid character code $Code"
}
