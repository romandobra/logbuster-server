@main[]
$data[^file:list[$DATA_PATH]]<hr>
$machines[^file:list[$MACHINES_PATH]]<hr>
$scripts[^file:list[$SCRIPTS_PATH]]<hr>

# <table>
# ^machines.foreach[;name]{
#     $machines.name
# }
# </table>

^soh[^last_log[brix]]

@last_log[m][f;n]
$result[^hash::create[]]
$f[^file:list[$DATA_PATH/$m/ssh]]
^f.sort{$f.name}[desc]
$n[^f.name.left(10)]

$f[^file::load[text;$DATA_PATH/$m/ssh/${n}.log]]
$f[^#0a$f.text]
$f[^f.split[^#0a${n}-logbuster]]
$result.[$n][
    ^f.menu{
        ^if(^f.offset[] == 0){^continue[]}
        $.[^f.offset[]][^parse_piece[$f.piece]]
    }
]

@parse_piece[s][line]
$s[^s.split[^#0a]]
$line[^s.piece.split[ ]]
$result[
#    $.line[$s.piece]
    $.type[^line.offset[set](1)$line.piece]

    ^if(^line.count[]>2){
        ^line.offset[set](2)
        $.name[$line.piece] }

    ^if(^line.count[]>3){
        ^line.offset[set](3)
        $.result[$line.piece] }

    ^if(^line.count[]>4){
        ^line.offset[set](4)
        $.extra[$line.piece] }

    ^if(^s.count[]>1){
        $.log[^s.menu{^if(^s.line[]>1){^s.piece.trim[]}}[^#0a]] }
]

