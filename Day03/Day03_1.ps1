$in = Get-Content .\Day03_input.txt
$FoundDouble = @()

#Lowercase item types a through z have priorities 1 through 26.
#Uppercase item types A through Z have priorities 27 through 52.
$Points = @{}
for ($i = 1; $i -lt 27; $i++) {
    
    $Points.Add( [char](96 + $i), $i)
}
for ($i = 27; $i -lt 53; $i++) {
    
    $Points.Add( [char](38 + $i), $i)
}
$in | ForEach-Object {
    $Length = $_.length
    $Half = $_.length / 2
    [Char[]]$FirstHalf = $_.Substring(0, $Half)
    [Char[]]$SecondHalf = $_.Substring($Half, $Half)   
    $Found = $false
    $FirstHalf | Select-Object -Unique | ForEach-Object {
        if ($SecondHalf -cmatch $_) {
            $foundDouble += $_
            "Found Double: $_ in $SecondHalf"
        } 
    }
}
$sum = 0
foreach ($Item in $FoundDouble) { 
    $sum += $Points.$([char]$Item)
}
$sum