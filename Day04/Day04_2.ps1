$in = Get-Content .\Day04_input.txt
#$in = Get-Content .\Day04_dummy_input.txt
$OverlappingPairs = 0
$in | ForEach-Object {
    $range = $_.split(",")
    [int[]]$RangePoints = $range.split("-")

    #Links in Rechts
    if ($RangePoints[0] -le $RangePoints[3] -AND $RangePoints[0] -ge $RangePoints[2] -OR $RangePoints[1] -ge $RangePoints[2] -and $RangePoints[1] -le $RangePoints[3]) {
        Write-Host $range[0] überschneidung in $range[1] -ForegroundColor Cyan
        $OverlappingPairs++   
    }
    elseif ($RangePoints[2] -le $RangePoints[0] -AND $RangePoints[2] -ge $RangePoints[1] -OR $RangePoints[3] -ge $RangePoints[0] -and $RangePoints[3] -le $RangePoints[1]) {
        Write-Host $range[1] überschenidung in $range[0] -ForegroundColor green
        $OverlappingPairs++
    }
    else {
        Write-Host "$range war keine überschneidung" -ForegroundColor RED
    }
}
$OverlappingPairs



