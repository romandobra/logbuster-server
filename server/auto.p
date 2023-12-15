@auto[]
$ROOT[^request:document-root.match[[\w-]+][g][..]]

$DATA_PATH[$ROOT/$request:argv.2]
$MACHINES_PATH[$ROOT/$request:argv.3]
$SCRIPTS_PATH[$ROOT/$request:argv.4]
$AUTH[$request:argv.5]


@is_developer[]
$result($request:argv.1)


@time_now[][t]
$t[^date::now[]]
$result(^t.unix-timestamp[])


@sol[o;s]
$result[^rep_l[^so[$o;$s]]]


@rep_l[s]
$result[^s.match[(^#0A+)][g]{ }]


@soh[o;s]
$result[^rep_br[^so[$o;$s]]]


@rep_br[s]
$result[^s.match[(^#0A+)][g]{<br>}]


# show object
@so[o;t;s]
^if(!def $t){$t[|]}
^switch[$o.CLASS_NAME]{
  ^case[string]{$result[${o}$s]}
  ^case[double]{$result[^if($o){OK}{NOK}$s]}
  ^case[bool]{$result[^if($o){OK}{NOK}$s]}
  ^case[hash]{$result[^sh[$o;^t.mid(0);$s]]}
  ^case[table]{$result[^o.csv-string[nameless]]}
  ^case[file]{$result[FILE:$o.name stderr:$o.stderr text:$o.text]}
  ^case[DEFAULT]{class_name:${o.CLASS_NAME}$s}}


# show hash
@sh[h;t;s]
^h.foreach[key;value]{
$s^t.mid(0)$key=^so[$value;^t.mid(0)^t.mid(0)]}[$s]
