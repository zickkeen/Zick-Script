# Dynamic DNS Update / Simple Edition
:local ddnsuser "zickkeen"
:local ddnspass "tuTHstMwhgu4Q5R"
:local ddnshost "man1ta.ddns.us"

:global ipBaru
:global ipSebelumnya

/tool fetch url="https://myip.dnsomatic.com/" mode=https dst-path=ipaddress.txt

:set ipBaru [/file get [/file find name=ipaddress.txt] contents]

:log info "set ipBaru: $ipBaru"

:if ([ :typeof $ipBaru ] = "nothing" ) do={
	:log info ("DDNS: tidak ada ip yang terset pada ipBaru $ipBaru, silahkan cek kembali")
} else={
  :if ($ipBaru != $ipSebelumnya) do={
    :log info "DDNS: mengirimkan update ip $ipBaru ke changeip.com!"
    :log info [ :put [/tool dns-update name=$ddnshost address=$ipBaru key-name=$ddnsuser key=$ddnspass ] ]
	:set ipSebelumnya $ipBaru
  } else={ 
    :log info "DDNS: ip saat ini $ipBaru sama dengan ip sebelumnya $ipSebelumnya"
  }
}