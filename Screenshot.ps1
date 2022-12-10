function Main($File) {
    Add-Type -AssemblyName System.Windows.Forms

    Add-type -AssemblyName System.Drawing

    $Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
    
    $Width = $Screen.Width
    $Height = $Screen.Height
    $Left = $Screen.Left
    $Top = $Screen.Top

    $bitmap = New-Object System.Drawing.Bitmap $Width, $Height

    $graphic = [System.Drawing.Graphics]::FromImage($bitmap)

    $graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)

    $bitmap.Save($File)

    Write-Output "Screenshot saved to: "
    Write-Output $File
}

Main($args[0])

[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)

   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
}

$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, 1000, 900)
screenshot $bounds "C:\screenshot.png"