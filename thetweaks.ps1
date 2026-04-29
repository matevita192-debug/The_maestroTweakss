Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Creazione della Finestra Principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "MATE PERFORMANCE TOOL"
$form.Size = New-Object System.Drawing.Size(400,500)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30) # Sfondo scuro professionale

# Titolo figo
$label = New-Object System.Windows.Forms.Label
$label.Text = "MATE TWEAKS"
$label.Font = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Bold)
$label.ForeColor = [System.Drawing.Color]::Cyan
$label.Size = New-Object System.Drawing.Size(300, 40)
$label.Location = New-Object System.Drawing.Point(50, 20)
$label.TextAlign = "MiddleCenter"
$form.Controls.Add($label)

# --- FUNZIONE BOTTONE FPS ---
$btnFPS = New-Object System.Windows.Forms.Button
$btnFPS.Text = "BOOST FPS"
$btnFPS.Size = New-Object System.Drawing.Size(300, 50)
$btnFPS.Location = New-Object System.Drawing.Point(50, 100)
$btnFPS.FlatStyle = "Flat"
$btnFPS.ForeColor = "White"
$btnFPS.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnFPS.Add_Click({
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    [System.Windows.Forms.MessageBox]::Show("FPS Boost Attivato!")
})
$form.Controls.Add($btnFPS)

# --- FUNZIONE BOTTONE INPUT DELAY ---
$btnLag = New-Object System.Windows.Forms.Button
$btnLag.Text = "RIDUCI INPUT LAG"
$btnLag.Size = New-Object System.Drawing.Size(300, 50)
$btnLag.Location = New-Object System.Drawing.Point(50, 170)
$btnLag.FlatStyle = "Flat"
$btnLag.ForeColor = "White"
$btnLag.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnLag.Add_Click({
    Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value 0
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" -Name "MouseDataQueueSize" -Value 20
    [System.Windows.Forms.MessageBox]::Show("Input Delay ridotto al minimo!")
})
$form.Controls.Add($btnLag)

# --- FUNZIONE BOTTONE PULIZIA ---
$btnClean = New-Object System.Windows.Forms.Button
$btnClean.Text = "PULIZIA TOTALE PC"
$btnClean.Size = New-Object System.Drawing.Size(300, 50)
$btnClean.Location = New-Object System.Drawing.Point(50, 240)
$btnClean.FlatStyle = "Flat"
$btnClean.ForeColor = "White"
$btnClean.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnClean.Add_Click({
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("PC Pulito!")
})
$form.Controls.Add($btnClean)

# Avvio dell'applicazione
$form.ShowDialog()