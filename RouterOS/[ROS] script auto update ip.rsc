# Dynamic DNS Update / Simple Edition
:global ddnsuser "[changeip_user]"
:global ddnspass "[changeip_pass]"
:global ddnshost "[changeip_host]"

:global ddnsip
:local resolvedIP [:resolve $ddnshost]

/tool fetch url="http://myip.dnsomatic.com/" mode=http dst-path=ipaddress.txt

:set ddnsip [/file get [/file find name=ipaddress.txt] contents]

:log info "set ddnsip: $ddnsip"

:if ([ :typeof $ddnsip ] = "nothing" ) do={
	:log info ("DDNS: tidak ada ip yang terset pada ddnsip $ddnsip, silahkan cek kembali")
} else={
  :if ($ddnsip != $resolvedIP) do={
    :log info "DDNS: mengirimkan update ip $ddnsip ke changeip.com!"
    :log info [ :put [/tool dns-update name=$ddnshost address=$ddnsip key-name=$ddnsuser key=$ddnspass ] ]
  } else={ 
    :log info "DDNS: ip saat ini $ddnsip sama dengan ip sebelumnya $resolvedIP"
  }
}