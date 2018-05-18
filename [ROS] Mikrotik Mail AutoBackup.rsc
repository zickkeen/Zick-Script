# Sebelumnya set SMTP Server terlebih dahulu
/tool e-mail set address="[IP SMTP Server]" from="" password="[password smtp]" port=[portsmtp] starttls=yes user="smtpusername"

#Script AutoBackup
# Dynamic autoBackup by Mail 
:global warnetname "Namanet"

:global email "emailtujuan@domain.com"
:global from "useraccount@smtp.com"

/system backup save name="$warnetname";
:delay 3s;
:log info "backup didapat: $warnetname";
/tool e-mail send to="$email" subject="Backup Mikrotik $warnetname" body="Backup mikrotik $warnetname" tls=yes file="$warnetname.backup" from="$from";
#untuk v6
#/tool e-mail send to="$email" subject="Backup Mikrotik $warnetname" body="Backup mikrotik $filename" start-tls=yes  file="$warnetname.backup" from="$from"
:log info "Backup dikirim ke email $email";
:delay 20s;
/file remove "$warnetname.backup";
:log info "file $warnetname.backup dihapus"
/ip dns cache flush

