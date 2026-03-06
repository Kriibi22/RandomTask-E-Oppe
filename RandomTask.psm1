$public = Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1"
$private = Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1"

foreach ($file in $private) {
    . $file.FullName
}

foreach ($file in $public) {
    . $file.FullName
}