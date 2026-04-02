# Get-Command -Name "*CIM*" -CommandType Cmdlet | Format-Table Name, ModuleName

# Get-CimClass -ClassName CIM_* | Format-Table CimClassName, CimSystemProperties

# Get-CimClass -ClassName *OperatingSystem | Format-Table CimClassName, CimSystemProperties

# get-ciminstance -ClassName CIM_Processor | Format-List Name, MaxClockSpeed, Description

# Get-CimInstance -ClassName Win32_Account | Format-Table Name, Caption, SID

# Get-CIMInstance -ClassName CIM_DiskPartition | Format-Table Name, BootPartition

$nb = (Get-CimInstance -ClassName CIM_Keyboard).NumberOfFunctionKeys

Write-Host $nb

