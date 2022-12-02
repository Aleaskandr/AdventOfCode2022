$in = Get-Content .\Day02_input.txt
$PointHash = @{
    'X' = 1
    'Y' = 2
    'Z' = 3
}
$ResultPoints = @{
    Loose = 0
    Draw  = 3
    Win   = 6
}
$MyPoints = 0
$in | ForEach-Object {
    $gegner = $_[0]
    $ich = $_[2]
    $differenz = [BYte][char]$ich - [Byte][char]$gegner
    switch ($differenz) {
        { $_ -in 25, 22 } {
            $MyPoints += $($PointHash."$ich") + $ResultPoints.Loose
            Write-Host "Case Loose"
        }
        { $_ -in 30, 24, 21 } {
            $MyPoints += $($PointHash."$ich") + $ResultPoints.Win
            Write-Host "Case Win"
        }
        23 {
            $MyPoints += $($PointHash."$ich") + $ResultPoints.Draw
            Write-Host "Case Draw"
        }
        Default {
        }
    }
            
    Write-Host " $gegner; $ich ; $($PointHash."$ich") ; $MyPoints "
}
