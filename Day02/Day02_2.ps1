
function Get-RightPick {
    param (
        $EnemyPick,
        $Result
    )

    switch ($result) {
        'X' {
            switch ($EnemyPick) {
                "A" {
                    $MyPoints = 3
                }
                "B" {
                    $MyPoints = 1
                }
                "C" {
                    $MyPoints = 2
                }
            } 
        }
        'Y' {
            switch ($EnemyPick) {
                "A" {
                    $MyPoints = 1 + 3
                }
                "B" {
                    $MyPoints = 2 + 3
                }
                "C" {
                    $MyPoints = 3 + 3
                }
            } 
        }
        'Z' {
            switch ($EnemyPick) {
                "A" {
                    $MyPoints = 2 + 6
                }
                "B" {
                    $MyPoints = 3 + 6
                }
                "C" {
                    $MyPoints = 1 + 6
                }
            }
        }
    }
    return [int]$MyPoints
}
$in = Get-Content .\Day02_input.txt
$MyPoints = 0
$in | ForEach-Object {
    $gegner = $_[0]
    $ShouldEnd = $_[2]
    $MyPoints += Get-RightPick -EnemyPick $gegner -Result $ShouldEnd
            
    Write-Host $MyPoints
}
