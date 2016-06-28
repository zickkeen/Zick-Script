# Dynamic VPN PASS / Simple Edition
:global vpnlama
:global vpnbaru

:if ([:len [/file find name=/import/passvpn.rsc]] > 0) do={/file remove /import/passvpn.rsc }
/tool fetch url="http://checkip.hol.es/converter/" mode=http dst-path=/import/passvpn.rsc

:set vpnbaru [/file get [/file find name=import/passvpn.rsc] contents]

:log info "Set New Pass to $vpnbaru"

:if ([ :typeof $vpnbaru ] = "" ) do={
	:log info ("vpnbaru: Tidak ditemukan, mohon diperiksa")
} else={
  :if ($vpnbaru != $vpnlama) do={
    :log info "Merubah pass vpn menjadi $vpnbaru"
    :log info [:put [/interface pptp-client set [find name=VPN] pass=$vpnbaru]]
	:set vpnlama $vpnbaru
  } else={ 
    :log info "Password VPN Saat ini sama seperti sebelumnya, tidak ada perubahan apapun"
  }
}
