[int[]]$in = Get-Content .\Day01_input.txt
$maxCarry = @(0, 0, 0)
$CurrentCarry = 0
$in | ForEach-Object {
    if ($_ -ne "0") {
        $CurrentCarry += $_
    }
    else {
        if ($CurrentCarry -gt $maxCarry[0]) {
            $maxCarry[2] = $maxCarry[1]
            $maxCarry[1] = $maxCarry[0]
            $maxCarry[0] = $CurrentCarry
        }
        elseif ($CurrentCarry -gt $maxCarry[1]) {
            $maxCarry[2] = $maxCarry[1]
            $maxCarry[1] = $CurrentCarry
        }
        elseif ($CurrentCarry -gt $maxCarry[2]) {
            $maxCarry[2] = $CurrentCarry
        }
        $CurrentCarry = 0
    }
}
$maxCarry | Measure-Object -Sum