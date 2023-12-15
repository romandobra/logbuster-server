@parse_log[t;d]
$result[^hash::create[]]
$t[^#0a$t]
$t[^t.split[^#0a${d}-logbuster]]

^t.menu{
    ^if(^t.offset[] == 0){^continue[]}
    $result.[^t.offset[]][^parse_piece[$t.piece]]
}


@parse_piece[s][line]
$s[^s.split[^#0a]]
$line[^s.piece.split[ ]]
$result[
#    $.line[$s.piece]
    $.type[^line.offset[set](1)$line.piece]

    ^line.offset[set](2)
    $.name[$line.piece]

    ^line.offset[set](3)
    $.result[$line.piece]

    ^if(^line.count[]>4){
        ^line.offset[set](4)
        $.extra[$line.piece] }

    ^if(^s.count[]>1){
        $.log[^s.menu{^if(^s.line[]>1){^s.piece.trim[]}}[^#0a]] }
]
