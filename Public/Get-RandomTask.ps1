function Get-RandomTask {
    <#
    .SYNOPSIS
        Tagastab juhuslikud PowerShelli harjutusülesanded.
    #>
    [CmdletBinding()]
    param(
        [ValidateSet('loops', 'functions', 'strings', 'files', 'OOP', 'arrays', 'objects')]
        [string]$Topic,

        [int]$MinDifficulty = 1,
        [int]$MaxDifficulty = 5,
        [int]$Count = 1,
        [switch]$IncludeHint,
        [switch]$AsText
    )

    # Leiame andmefaili tee
    $dataPath = Join-Path -Path $PSScriptRoot -ChildPath "..\Data\tasks.json"
    $allTasks = Get-TaskData -Path $dataPath

    if (-not $allTasks) {
        Write-Warning "Andmeid ei suudetud laadida."
        return
    }

    # FILTREERIMISE PARANDUS: Kontrollime, et Topic oleks olemas v6i filter t6ene
    $filtered = $allTasks | Where-Object {
        ([string]::IsNullOrWhiteSpace($Topic) -or $_.Topic -eq $Topic) -and
        ($_.Difficulty -ge $MinDifficulty) -and
        ($_.Difficulty -le $MaxDifficulty)
    }

    if ($null -eq $filtered -or @($filtered).Count -eq 0) {
        Write-Warning "Ühtegi ülesannet antud filtritega ei leitnud. (Leitud kokku: $($allTasks.Count) ülesannet)"
        return
    }

    # Juhuslik valik
    $selected = $filtered | Get-Random -Count $Count

    foreach ($task in $selected) {
        $normalized = Normalize-Task -RawTask $task
        if ($AsText) {
            $output = @"
`n--------------------------------------------------
PEALKIRI: $($normalized.Title) [$($normalized.Topic)]
RASKUSASTE: $($normalized.Difficulty) / 5
ÜLESANNE: $($normalized.Task)
NÄIDIS: $($normalized.OutputExample)
AEG: $($normalized.EstimatedTimeMin) min
"@
            if ($IncludeHint -and $normalized.Hint) {
                $output += "`nVIHJE: $($normalized.Hint)"
            }
            $output += "`n--------------------------------------------------"
            Write-Host $output
        } else {
            Write-Output $normalized
        }
    }
}