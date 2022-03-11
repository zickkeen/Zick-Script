# Dynamic DNS Update / Simple Edition
:local ddnscode "MTkyNDQzMjo5NjUxNDkwOTpiMmU4ZWNjODhhNDNkMWZhYjZkNDBmZWI1MjZhOTljMTY3YjBiOTA0NmEyNDhjODczYWFmNTk4NjQ5NDMzMjE0"
:local resolvedIP [:resolve $ddnshost]
:local ddnsipnow
:global ddnsiplama

/tool fetch url="http://myip.dnsomatic.com/" mode=http dst-path=ipaddress.txt

:set ddnsipnow [/file get [/file find name=ipaddress.txt] contents]

:log info "set ddnsipnow: $ddnsipnow"
:if ( $ddnsipnow != $ddnsiplama ) do={
	:if ([ :typeof $ddnsipnow ] = "nothing" ) do={
	   :log info ("DDNS: tidak ada ip yang terset pada ddnsipnow $ddnsipnow, silahkan cek kembali")
	} else={
	   :if ($ddnsipnow = $resolvedIP) do={
		:log info "DDNS: mengirimkan update ip $ddnsipnow ke changeip.com!"
		   :log info [ :put [/tool fetch url="https://ipv4.cloudns.net/api/dynamicURL/?q=$ddnscode" mode=http ] ]
		   :log info ("Ip Berhasili diset ke $ddnsipnow")
		   :log info [ :put [:set ddnsiplama $ddnsipnow ]]
	   } else={ 
		   :log info "DDNS: ip saat ini $ddnsipnow sama dengan ip sebelumnya $resolvedIP"
	   }
	}
}
