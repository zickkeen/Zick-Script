:local penggunaan [/queue simple get number=1 value-name=bytes];
:local jmlbin [:len $penggunaan]
:local bin [:find $penggunaan "/" -1]
:local bytesIN [:pick $penggunaan 0 $bin]
:local bytesOUT [:pick $penggunaan ($bin+1) $jmlbin]
:local BInFo ( $bytesIN / 1048576 )
:local BOutFo ( $bytesOUT / 1048576 )
:log info $BInFo
:log info $BOutFo