function Load-Alphabet($alphabetName, $To) {
    $alphabet = New-Object System.Collections.Specialized.OrderedDictionary
    gc $PSScriptRoot\$alphabetName | % {
        $a = $_ -split ' '
        if ($To -eq 'lat') { $alphabet.Add($a[0], $a[1]) } else { $alphabet.Add($a[1], $a[0]) }
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

    $alphabet = Load-Alphabet serbian $To
    $alphabet.GetEnumerator() | % { $Text = $Text.Replace($_.Name, $_.Value) }
    $Text
}

sal translit get-transliteration
