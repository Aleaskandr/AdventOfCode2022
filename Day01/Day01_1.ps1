[int[]]$in = Get-Content .\Day01_input.txt
$maxCarry = 0
$CurrentCarry = 0
$in | ForEach-Object {
    if ($_ -ne "0") {
        $CurrentCarry += $_
    }
    else {
        if ($CurrentCarry -gt $maxCarry) {
            $maxCarry = $CurrentCarry
        }
        $CurrentCarry = 0
    }
}
$maxCarry