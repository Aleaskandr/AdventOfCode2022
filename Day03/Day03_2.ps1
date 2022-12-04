$in = Get-Content .\Day03_input.txt
$FoundDouble = @()
$Foundbadge = @()

for ($i = 0; $i -lt $in.Length; $i += 3) {
    $FoundDouble = @()
    $j = $i + 2
    $Group = $in[$i..$j]
    for ($k = 0; $k -lt 3; $k++) {
        
        $Group[$k] = [char[]]$group[$k] | Select-Object -Unique
    }
    #0 mit 1 vergleichen
    $Group[0] | ForEach-Object {
        if ($Group[1] -cmatch $_) {
            $foundDouble += $_
            "Found Double: $_ "
        } 
    }
    #ergebniss mit 2 vergleichen
    $foundDouble  | ForEach-Object {
        if ($Group[2] -cmatch $_) {
            $foundBadge += $_
            "Found Badge: $_"
        } 
    }


}
#Lowercase item types a through z have priorities 1 through 26.
#Uppercase item types A through Z have priorities 27 through 52.
$Points = @{}
for ($i = 1; $i -lt 27; $i++) {
    
    $Points.Add( [char](96 + $i), $i)
}
for ($i = 27; $i -lt 53; $i++) {
    
    $Points.Add( [char](38 + $i), $i)
}

$sum = 0
foreach ($Item in $FoundBadge) { 
    $sum += $Points.$([char]$Item)
}
$sum
