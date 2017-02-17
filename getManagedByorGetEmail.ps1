function get-ManagedBy {
#Get Domain
$domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$root = $domain.GetDirectoryEntry()

#Find computer in Domain
$search = [System.DirectoryServices.DirectorySearcher]$root
$search.Filter = "(&(cn=$env:COMPUTERNAME)(objectcategory=Computer))"
$result = $search.FindOne()
$computer = [ADSI]$result.path

#return managedBy
$computer.managedBy

}

function get-email ($dn) {

#Get Domain
$domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$root = $domain.GetDirectoryEntry()

#Find computer in Domain
$search = [System.DirectoryServices.DirectorySearcher]$root
$search.Filter = "(&(distinguishedname=$dn)(objectcategory=Person))"
$result = $search.FindOne()
$user = [ADSI]$result.path

$user.mail
}
