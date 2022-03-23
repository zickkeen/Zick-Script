# Sebelumnya set SMTP Server terlebih dahulu
:global smtpserver "smtp.google.com"
:global smtpuser "xxxxxxx@gmail.com"
:global smtppass "xxxxxxxxxxxxxxxxxxxxx" #Gunakan password khusus aplikasi agar lebih aman jika menggunakan server gmail

/tool e-mail set address=$smtpserver from="" password=$smtppass port=[portsmtp] starttls=yes user=$smtpuser

#Script AutoBackup
# Dynamic autoBackup by Mail 
:global routername "NamaRouter"

:global email "emailtujuan@domain.com"
:global from "useraccount@smtp.com"

/system backup save name="$routername";
:delay 3s;
:log info "backup didapat: $routername";
/tool e-mail send to="$email" subject="Backup Mikrotik $routername" body="Backup mikrotik $routername" tls=yes file="$routername.backup" from="$from";
#untuk v6
#/tool e-mail send to="$email" subject="Backup Mikrotik $routername" body="Backup mikrotik $filename" start-tls=yes  file="$routername.backup" from="$from"
:log info "Backup dikirim ke email $email";
:delay 20s;
/file remove "$routername.backup";
:log info "file $routername.backup dihapus"

