function IsDMXInJail {
      <#
      .SYNOPSIS
      Is DMX in jail ? Good question!
      .DESCRIPTION
      Return True if DMX is in Jail
      .EXAMPLE
      if (Get-DMXPrisonStatut -eq $True){Write-Host("DMX est en prison!")}
      else{Write-Host("DMX est libre!")}
      #>
    $IsDmxInJail = Invoke-WebRequest -Uri 'http://isdmxinjail.com/'
    foreach($ligne in $IsDmxInJail.tostring().split("`n"))
    {
        if($ligne -like "*<h1>DMX*")
        {
            if($ligne -like "*definitely*"){return $True} # If DMX is in jail
            if($ligne -like "*not*"){return $False} # If DMX is not in jail
        }
    }
}