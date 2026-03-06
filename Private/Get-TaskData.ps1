function Get-TaskData {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    if (Test-Path $Path) {
        $json = Get-Content -Raw -Path $Path
        return $json | ConvertFrom-Json
    } else {
        Write-Error "Andmefaili ei leitud asukohast: $Path"
    }
}