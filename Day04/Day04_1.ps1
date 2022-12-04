$in = Get-Content .\Day04_input.txt
$OverlappingPairs = 0
$in | ForEach-Object {
    $range = $_.split(",")
    [int[]]$RangePoints = $range.split("-")

    #Links in Rechts
    if ($RangePoints[0] -ge $RangePoints[2] -AND $RangePoints[1] -le $RangePoints[3]) {
        Write-Host $range[0] ist in $range[1] -ForegroundColor Cyan
        $OverlappingPairs++   
    }
    elseif ($RangePoints[2] -ge $RangePoints[0] -AND $RangePoints[3] -le $RangePoints[1]) {
        Write-Host $range[1] ist in $range[0] -ForegroundColor green
        $OverlappingPairs++
    }
    else {
        Write-Host "$range war keine überschneidung" -ForegroundColor RED
    }
}
$OverlappingPair