. $PSScriptRoot\translit.ps1 -Force

$cTest = @(
 'велика лисица прескаче журно луњајући се љупко на џаку'
 )

$cRes = @(
 'velika lisica preskače žurno lunjajući se ljupko na džaku'
)

$lTest = @(
 'Ovom uredbom uređuju se izgled, sadržaj i način popunjavanja obrazaca, kao i način dostavljanja i obrade podataka koji se unose u Registar zaposlenih, izabranih, postavljenih i angažovanih lica u javnom sektoru.'
 'Uprava za trezor je sastavni deo Ministarstva finansija. Osnovana je 01. avgusta 2005. godine i nasledila je tadašnju Upravu za javna plaćanja i nekadašnji Zavod za obračun i plaćanja.'
 'PHxLjGIFČUZS7znTmGTl'
 'PHxlJGIFČUZS7znTmGTl'
 'džoker'
 'dŽoker'
 'Džoker'
 'DŽoker'
 'DŽPBWU2G4zlSHČT8HH93ć'
 'NS2AmMUoCoDjJ3VHISmY'
 'Dj'
 'DJ'
 'dj'
 'dJ'
 '3SFzGŽ4NSD5PGOeDJrGK'
 'dju51OIWZvVPZdeWTv5N5KnUf'
 '14ŠqWUlТeIАW88PĐXdQ'
)

$lRes =@(
 'Овом уредбом уређују се изглед, садржај и начин попуњавања образаца, као и начин достављања и обраде података који се уносе у Регистар запослених, изабраних, постављених и ангажованих лица у јавном сектору.'
 'Управа за трезор је саставни део Министарства финансија. Основана је 01. августа 2005. године и наследила је тадашњу Управу за јавна плаћања и некадашњи Завод за обрачун и плаћања.'
 'ПХxЉГИФЧУЗС7знТмГТл',
 'ПХxљГИФЧУЗС7знТмГТл',
 'џокер'
 'џокер'
 'Џокер'
 'Џокер'
 'ЏПБWУ2Г4злСХЧТ8ХХ93ћ'
 'НС2АмМУоЦоЂЈ3ВХИСмY'
 'Ђ'
 'Ђ'
 'ђ'
 'ђ'
 '3СФзГЖ4НСД5ПГОеЂрГК'
 'ђу51ОИWЗвВПЗдеWТв5Н5КнУф'
 '14ШqWУлТеИАW88пЂХдQ'
)

$i=0; $f=0; $g=0;

$cTest | % {
    $t = translit $_
    $r = $cRes[$i]
    if ($r -ceq $t) { $g++} else {
        "Test $i failed"
        "  input   $_"
        "  trans   $t"
        "  should  $r"
        ""
        $f++
    }
    $i++
}

$i = 0;
$lTest | % {
    $t = translit $_ -To cyr
    $r = $lRes[$i]
    if ($r -ceq $t) { $g++} else {
        "Test $i failed"
        "  input   $_"
        "  trans   $t"
        "  should  $r"
        ""
        $f++
    }
    $i++
}

"-"*40
"$g tests ok"
"$f tests failed"
