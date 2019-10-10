
Import-Module Get-ChildItemColor
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
function ls-la {
    Get-ChildItemColor -Force
}
Set-Alias ll ls-la -Option AllScope

# Helper function to show Unicode characters
function U
{
    param
    (
        [int] $Code
    )
 
    if ((0 -le $Code) -and ($Code -le 0xFFFF))
    {
        return [char] $Code
    }
 
    if ((0x10000 -le $Code) -and ($Code -le 0x10FFFF))
    {
        return [char]::ConvertFromUtf32($Code)
    }
 
    throw "Invalid character code $Code"
}
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
# Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

Set-Alias dc docker-compose
Set-Alias d docker

function Docker-compose_up {  
    docker-compose up -d
}
Set-Alias dcup Docker-compose_up  
