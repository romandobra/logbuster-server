@main[]
$data[^file:list[$DATA_PATH]]
$scripts[^file:list[$SCRIPTS_PATH]]

^use[logs.p]
^use[machines.p]
$machines[^machines_list[]]

$cols[^all_cols[$machines]]
#^soh[$cols]
<table border=1>
<tr><td></td>^machines.foreach[;m]{<td>$m.name</td>}</tr>

^cols.foreach[col;]{

    <tr>
    <td>$col</td>
    ^machines.foreach[;m]{
        $s[^m.log.select[;v]($v.name eq $col)]
        <td>
        ^if($s){
            $ss[^s.at[first;value]]
            <div class="$ss.result" title="$ss.log">
                ^if(^ss.log.trim[] ne ""){^ss.log.left(16)}{&nbsp}
                ^if(^ss.extra.trim[] ne ""){<span class="extra">$ss.extra</span>}
            </div>
        }{-}
        </td>
        $s[^hash::create[]]
    }
    </tr>
}
</table>

#^soh[$machines]<hr>


@all_cols[m][v]
$result[^hash::create[]]
^m.foreach[k;v]{
    ^v.log.foreach[;vv]{
        $result.[$vv.name](1)
    }
}

@del[]

# <table>
# ^machines.foreach[;name]{
#     $machines.name
# }
# </table>
