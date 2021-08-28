@echo off
echo RDP CREATION SUCCESSFULL!
tasklist | find /i "ngrok.exe" >Nul && goto check || echo "Unable to get NGROK tunnel, make sure NGROK_AUTH_TOKEN is correct in Settings > Secrets > Repository secret. Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels" & ping 127.0.0.1 >Nul & exit
:check
ping 127.0.0.1 > null
cls
echo IP : tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Tidak bisa mendapatkan NGROK tunnel, pastikan NGROK_AUTH_TOKEN benar di Settings> Secrets> Repository secret. Mungkin VM Anda sebelumnya masih berjalan: https://dashboard.ngrok.com/status/tunnels "
goto check
