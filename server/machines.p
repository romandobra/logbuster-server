@machines_list[][l;f;c;n]
$l[^file:list[$MACHINES_PATH]]
$result[^hash::create[]]
$c(0)
^l.menu{
    ^if(^l.name.left(1) eq _){^continue[]}
    $c($c+1)

    $result.[$c][
        $.name[$l.name]

        $f[^file::load[text;$MACHINES_PATH/$l.name]]
        $.config[$f.text]

        $f[^file:list[$DATA_PATH/$l.name/ssh]]
        ^f.sort{$f.name}[desc]
        $n[^f.name.left(10)]
        $.log_date[$n]

        $f[^file::load[text;$DATA_PATH/$l.name/ssh/${n}.log]]
        $.log[^parse_log[$f.text;$n]]
    ]
}
^result.sort[;m]{$m.name}
