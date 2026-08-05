Get-WinEvent -ListLog * | ForEach-Object {
    try {
        [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($_.LogName)
        Write-Host "완전 삭제: $($_.LogName)"
    } catch { Write-Host "그래도 못 지움: $($_.LogName)" -ForegroundColor Yellow }
}
