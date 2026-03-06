function Normalize-Task {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        $RawTask
    )
    return [pscustomobject]@{
        Id               = [int]$RawTask.Id
        Title            = [string]$RawTask.Title
        Topic            = [string]$RawTask.Topic
        Difficulty       = [int]$RawTask.Difficulty
        Task             = [string]$RawTask.Task
        Hint             = [string]$RawTask.Hint
        OutputExample    = [string]$RawTask.OutputExample
        EstimatedTimeMin = [int]$RawTask.EstimatedTimeMin
        Author           = [string]$RawTask.Author
    }
}