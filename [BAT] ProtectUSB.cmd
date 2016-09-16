@echo off
set vers=2.1
title .: Zick Protector v %vers%:.
color 9F

echo  Aplikasi ini akan menciptakan beberapa file dan folder, yakni:
echo  FOLDER:
echo  - Autorun.inf
echo  - Copy of Shortcut to (1).lnk
echo  - Copy of Shortcut to (2).lnk
echo  - Copy of Shortcut to (3).lnk
echo  - Copy of Shortcut to (4).lnk
echo  FILE:
echo  - $Recycle.Bin 
echo  - Recycled
echo  - Recycler
echo.
echo  Folder dan file tersebut tidak dapat dihapus pada drive yang akan anda pilih
echo  selanjutnya. Folder dan file tersebut berfungsi untuk mencegah virus/worm yang
echo  menjalankan aksinya dengan memanfaatkan file dan folder tersebut. Mungkin
echo  folder/file  ini akan dideteksi virus oleh beberapa antivirus, sebaiknya
echo  abaikan saja! karena hanya tiruan dari virus yang tidak berbahaya.
echo.
echo  Copyright @ 2012 Zick Soft.
echo.
echo  Apakah anda setuju untuk menggunakan aplikasi ProtectorUSB ini? Y/N
set /p agr= 
if "%agr%"=="Y" goto proses
if "%agr%"=="y" goto proses
if "%agr%"=="yes" goto proses
if "%agr%"=="ya" goto proses
goto x

:proses
cls
echo  Silahkan pilih untuk mengaktifkan atau menonaktifkan ProtectorUSB!
echo.
echo   1. Aktifkan
echo   2. Non Aktifkan (Membatalkan Zick Protector)
echo   3. Keluar
echo.
set /p twk= Silahkan Pilih: 
if "%twk%"=="1" goto d
if "%twk%"=="2" goto d
if "%twk%"=="3" goto x
goto proses

:d
set /p usbdr=Pilih flashdrive (ex. E) : 
if not exist %usbdr%:\nul echo Drive %usbdr%:\ tidak ditemukan
if not exist %usbdr%:\nul goto d
cls
if "%twk%"=="1" goto m
if "%twk%"=="2" goto r
goto d

:m
if exist %usbdr%:\zickprotector goto errz
if exist %usbdr%:\Recycler\nul rmdir /s /q \\.\\%usbdr%:\Recycler
if exist %usbdr%:\Recycler del /f /q /a %usbdr%:\Recycler
echo Zickkeen Protector v%vers%> %usbdr%:\Recycler
attrib %usbdr%:\Recycler +r +s +h
echo File %usbdr%:\Recycler berhasil terbentuk

if exist %usbdr%:\$Recycle.Bin\nul rmdir /s /q \\.\\%usbdr%:\$Recycle.Bin
if exist %usbdr%:\$Recycle.Bin del /f /q /a %usbdr%:\$Recycle.Bin
echo Zickkeen Protector v%vers%> %usbdr%:\$Recycle.Bin
attrib %usbdr%:\$Recycle.Bin +r +s +h
echo File %usbdr%:\$Recycle.Bin berhasil terbentuk

if exist %usbdr%:\Recycled\nul rmdir /s /q \\.\\%usbdr%:\Recycled
if exist %usbdr%:\Recycled del /f /q /a %usbdr%:\Recycled
echo Zickkeen Protector v%vers%> %usbdr%:\Recycled
attrib %usbdr%:\Recycled +r +s +h
echo File %usbdr%:\$Recycled berhasil terbentuk

if exist %usbdr%:\Autorun.inf del /f /q /a %usbdr%:\Autorun.inf
mkdir \\.\\%usbdr%:\Autorun.inf\nul.ZickProtector\nul.DoubleZickProtector
attrib %usbdr%:\Autorun.inf +s +h
echo Folder %usbdr%:\Autorun.inf berhasil terbentuk

if exist %usbdr%:\"Copy of Shortcut to (1)".lnk del /f /q /a %usbdr%:\"Copy of Shortcut to (1)".lnk
mkdir \\.\\%usbdr%:\"Copy of Shortcut to (1)".lnk\nul.ZickProtector
attrib %usbdr%:\"Copy of Shortcut to (1)".lnk +s +h
echo Folder %usbdr%:\"Copy of Shortcut to (1)".lnk berhasil terbentuk

if exist %usbdr%:\"Copy of Shortcut to (2)".lnk del /f /q /a %usbdr%:\"Copy of Shortcut to (2)".lnk
mkdir \\.\\%usbdr%:\"Copy of Shortcut to (2)".lnk\nul.ZickProtector
attrib %usbdr%:\"Copy of Shortcut to (2)".lnk +s +h
echo Folder %usbdr%:\"Copy of Shortcut to (2)".lnk berhasil terbentuk

if exist %usbdr%:\"Copy of Shortcut to (3)".lnk del /f /q /a %usbdr%:\"Copy of Shortcut to (3)".lnk
mkdir \\.\\%usbdr%:\"Copy of Shortcut to (3)".lnk\nul.ZickProtector
attrib %usbdr%:\"Copy of Shortcut to (3)".lnk +s +h
echo Folder %usbdr%:\"Copy of Shortcut to (3)".lnk berhasil terbentuk

if exist %usbdr%:\"Copy of Shortcut to (4)".lnk del /f /q /a %usbdr%:\"Copy of Shortcut to (4)".lnk
mkdir \\.\\%usbdr%:\"Copy of Shortcut to (4)".lnk\nul.ZickProtector
attrib %usbdr%:\"Copy of Shortcut to (4)".lnk +s +h
echo Folder %usbdr%:\"Copy of Shortcut to (4)".lnk berhasil terbentuk

if exist %usbdr%:\zickprotector\nul rmdir /s /q \\.\\%usbdr%:\zickprotector
if exist %usbdr%:\zickprotector del /f /q /a %usbdr%:\zickprotector
echo Zickkeen Protector v%vers%> %usbdr%:\zickprotector
attrib %usbdr%:\zickprotector +r +s +h
echo Zick Protector berhasil menonaktifkan proteksi pada flashdrive anda.
pause
goto x

:r
if not exist %usbdr%:\zickprotector goto nn
rmdir /s /q \\.\\%usbdr%:\Autorun.inf
echo Folder %usbdr%:\AUTORUN.INF berhasil dihapus
del /f /q /a %usbdr%:\Recycled
echo File %usbdr%:\Recycled berhasil dihapus
del /f /q /a %usbdr%:\Recycler
echo File %usbdr%:\Recycler berhasil dihapus
del /f /q /a %usbdr%:\$Recycle.Bin
echo File %usbdr%:\$Recycle.Bin berhasil dihapus
rmdir /s /q \\.\\%usbdr%:\"Copy of Shortcut to (1)".lnk
echo Folder %usbdr%:\"Copy of Shortcut to (1)".lnk berhasil dihapus
rmdir /s /q \\.\\%usbdr%:\"Copy of Shortcut to (2)".lnk
echo Folder %usbdr%:\"Copy of Shortcut to (2)".lnk berhasil dihapus
rmdir /s /q \\.\\%usbdr%:\"Copy of Shortcut to (3)".lnk
echo Folder %usbdr%:\"Copy of Shortcut to (3)".lnk berhasil dihapus
rmdir /s /q \\.\\%usbdr%:\"Copy of Shortcut to (4)".lnk
echo Folder %usbdr%:\"Copy of Shortcut to (4)".lnk berhasil dihapus
del /f /q /a %usbdr%:\zickprotector
echo Proteksi Zick Protector telah berhasil dinonaktifkan pada flashdrive anda.
pause
goto x

:errz
echo.
echo Zick Protector sudah pernah terinstal pada flashdrive tersebut...!!!
echo.
echo Apakah anda akan menonaktifkan Zick Protector?
set /p tny=Pilih y/n :
if "%tny%"=="y" goto r
if "%tny%"=="Y" goto r
if "%tny%"=="n" goto x
if "%tny%"=="N" goto x
EXIT
 
:nn
set usbdr=
echo.
echo Zick Protector belum pernah terinstal pada flashdrive tersebut...!!!
echo.
echo.
echo Apakah anda akan mengaktifkan Zick Protector?
set /p ask=Pilih y/n : 
if "%ask%"=="y" goto proses
if "%ask%"=="Y" goto proses
EXIT

:x
cls
echo Apakah anda ingin kembali ke menu awal?
set /p tna=Pilih y/n :
if "%tna%"=="y" goto proses
if "%tna%"=="Y" goto proses
set usbdr=
echo.
echo Terimakasih telah menggunakan zick protector...!!!
echo.
echo.
echo Tekan tombol apapun untuk KELUAR
pause>nul

rem Log Version
rem V1.1
rem - Protector Autorun.inf
rem v1.2
rem - Penambahan protector Autorun.inf >> nul.ZickProtector
rem   untuk mencegah penghapusan folder
rem v2.0
rem - Penambahan file Recycler, Recycled dan $Recycle.Bin
rem - Penambahan folder Copy of "Shortcut to (1).lnk" sampai "Shortcut to (4).lnk"
rem - penyempurnaan script lama
rem v.2.1
rem - Penambahan file zickprotector untuk mengetahui apakah sudah ada instalasi sebelumnya
rem - Penyempurnaan versi sebelumnya
rem - Penambahan kode versi
rem - penambahan log version
rem v.2.2
rem - Penambahan pilihan kembali ke menu awal pada akhir sesi
rem - Penambahan info bahwa aktivasi dan deaktivasi berhasil