. $PSScriptRoot\translit.ps1


$cTest = @(
 'велика лисица прескаче журно луњајући се љупко на џаку'
)

$cRes = @(
 'velika lisica preskače žurno lunjajući se ljupko na Džaku'
)

$lTest = @(
 'Ovom uredbom uređuju se izgled, sadržaj i način popunjavanja obrazaca, kao i način dostavljanja i obrade podataka koji se unose u Registar zaposlenih, izabranih, postavljenih i angažovanih lica u javnom sektoru.'
 'Uprava za trezor je sastavni deo Ministarstva finansija. Osnovana je 01. avgusta 2005. godine i nasledila je tadašnju Upravu za javna plaćanja i nekadašnji Zavod za obračun i plaćanja.'
)

$lRes =@(
 'Овом уредбом уређују се изглед, садржај и начин попуњавања образаца, као и начин достављања и обраде података који се уносе у Регистар запослених, изабраних, постављених и ангажованих лица у јавном сектору.'
 'Управа за трезор је саставни део Министарства финансија. Основана је 01. августа 2005. године и наследила је тадашњу Управу за јавна плаћања и некадашњи Завод за обрачун и плаћања.'
)

$i=0; $f=0; $g=0;

$cTest | % {
    $t = translit $_
    $r = $cRes[$i]
    if ($r -eq $t) { $g++} else {
        "Test $i failed"
        "  $t"
        "  $r"
        $f++ 
    }
    $i++
}

$i = 0;
$lTest | % {
    $t = translit $_ -To cyr
    $r = $lRes[$i]
    if ($r -eq $t) { $g++} else {
        "Test $i failed"
        "  $t"
        "  $r"
        $f++ 
    }
    $i++
}

"-"*40
"$g tests ok"
"$f tests failed"
