while (1 -eq 1) {

$response = Invoke-WebRequest -Uri "https://google.com.au"
if ($response) {

    echo "Success. We have a response"
    (New-Object Media.SoundPlayer "C:\WINDOWS\media\Alarm01.wav").Play()
    sleep 7
} else {

    echo "sleeping"
    sleep 30
}

Remove-Variable -name response
}
