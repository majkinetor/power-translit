# Author: Miodrag Milic <miodrag.milic@gmail.com>
# Last Change: 2024-09-17
# Version: 1.1

#requires -version 3.0

function Load-Alphabet($alphabetName, $To) {
    $alphabet = New-Object System.Collections.Specialized.OrderedDictionary
    Get-Content $PSScriptRoot\$alphabetName | % {
        $a = $_ -split ' '
        if ($To -eq 'lat') {
            $alphabet.Add($a[0], $a[1])
        } else {
            if ($a[1].Length -eq 2 -and [char]::IsUpper($a[1][0])) {
                $alphabet.Add( $a[1].ToUpper(), $a[0] )
                $alphabet.Add( [char]::ToLower($a[1][0]) + [char]::ToUpper($a[1][1]), $a[0].ToLower() )
            }
            $alphabet.Add($a[1], $a[0])
        }
    }

    if ($To -eq 'cyr') { # move double chars to the front
        $global:alphabet2 = New-Object System.Collections.Specialized.OrderedDictionary
        $alphabet.GetEnumerator() | % { if ($_.Name.Length -eq 2) { $alphabet2.Add($_.Name, $_.Value ) } }
        $alphabet.GetEnumerator() | % { if ($_.Name.Length -eq 1) { $alphabet2.Add($_.Name, $_.Value ) } }
        return $alphabet2
    }
    $alphabet
}

function Get-Transliteration {
    [CmdletBinding()]
    param(
        #Text to be translated
        [string] $Text,

        #Direction of translation
        [ValidateSet('lat', 'cyr')]
        [string] $To = 'lat'
       )

    $global:alphabet = Load-Alphabet serbian $To
    $alphabet.GetEnumerator() | % { $Text = $Text.Replace($_.Name, $_.Value, $false, $null) }
    $Text
}

sal translit get-transliteration
