$fileout = "\\ad\d$\script\vpkbook.txt"
"|_. ФИО |_. Подразделение/Отдел |_. Почта |_. Вн. телефон |_. Моб. телефон |" > $fileout

$list = Get-ADUser -Filter {((Department -ne "null") -and (Description -ne "null")) -and ((mail -ne "null") -or (ipPhone -ne "null") -or (MobilePhone -ne "null")) -and (enabled -eq "true")} -Properties Department,title, Description,Name,mail,ipPhone,MobilePhone | sort Name
ForEach ($n in $list) {
$str =  "|_." + $n.Name + "|_." + $n.Department + "|_." + $n.title + "|_." + $n.mail + "|_." + $n.ipPhone + "|_." + $n.MobilePhone + "|" 
$str >> $fileout
}
