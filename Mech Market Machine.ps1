<#
    _   __              ____    __              _     
   / | / /__  _________/ / /_  / /___  ____ _  (_)___ 
  /  |/ / _ \/ ___/ __  / __ \/ / __ \/ __ `/ / / __ \
 / /|  /  __/ /  / /_/ / /_/ / / /_/ / /_/ / / / /_/ /
/_/ |_/\___/_/   \__,_/_.___/_/\____/\__, (_)_/\____/ 
                                    /____/            


 ____ ____ ____ ____                
||M |||e |||c |||h ||               
||__|||__|||__|||__||               
|/__\|/__\|/__\|/__\|               
 ____ ____ ____ ____ ____ ____      
||M |||a |||r |||k |||e |||t ||     
||__|||__|||__|||__|||__|||__||     
|/__\|/__\|/__\|/__\|/__\|/__\|     
 ____ ____ ____ ____ ____ ____ ____ 
||M |||a |||c |||h |||i |||n |||e ||
||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

By John
 ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||P |||r |||e |||r |||e |||q |||u |||i |||s |||i |||t |||e |||s ||
||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

1.Create a csv file with formatted column names.

 |  A  |   B  |    C   |  D  |   E    |  F  |  G  |
 |Brand|Sculpt|Colorway|Price|Location|Image|Notes|

2.Fill in your keycap information! It does no sorting, so you have to sort in the csv file.

 |Brand |Sculpt |Colorway  |Price|Location|                                  Image                              |Notes|
 |Booper|Colonel|Pax Purple| $53 |   A1   |http://nerdblog.io/wp-content/uploads/2018/05/IMG_20180430_185228.jpg|     |

3.Obtain a keyboard timestamp url
#>

#Declare Variables

$ArtisanFile = ".\Keycaps.csv" #This is the file location of your keycaps.csv file.
$RedditOutput = ".\RedditPost.txt" #This is the location of where it will save the text file.
$Timestamp = Read-Host "Enter Timestamp Url" #This is your timestamp url, 
$PostBody = ""
$LineBreak = "

---

"
$Timetext = "[Timestamp]($Timestamp)
"
$CustomizeText = "HERE" #This is where you type your custom message to mech market, between the two quotes where it says HERE
<#
For the wantlist, I left my custom wants in there as an example on how to do an unordered list.
You can find reddit formatting online, I used www.redditpreview.com
#>

$Wantlist = "
#Wants

- Hyperfuse Colorway Keycaps
- Jak
- Artkey
- Nightcaps
- Gaf
- Keyforge
- Beer
- Projects for [Nerdblog.io](http://www.nerdblog.io)
"

#Do not fiddle with this code
$NerdCredit = Read-host "Would you like to give mention to nerdblog.io's script? Y/N"
$PostBody += $Timetext
$PostBody += $LineBreak
$Postbody += $CustomizeText
$PostBody += $LineBreak
$Postbody += "
Columns are Letters, Rows are numbers.

|Brand|Sculpt|Colorway|Price|Location|Image|Notes|
|:-|:-|:-|:-|:-|:-|:-|
"
$Artisans = Import-Csv $ArtisanFile
ForEach ($Artisan in $Artisans){
$Brand = $($Artisan.Brand)
$Sculpt = $($Artisan.Sculpt)
$Colorway = $($Artisan.Colorway)
$Price = $($Artisan.Price)
$Location = $($Artisan.Location)
$Image = "[Image](" + $($Artisan.Image) + ")"
$Notes = $($Artisan.Notes)
$Postbody += "|$Brand|$Sculpt|$Colorway|$Price|$Location|$Image|$Notes|
"
}
$PostBody += $LineBreak
$PostBody += $WantList
$PostBody += $LineBreak
if ($NerdCredit -eq 'Y' -OR $NerdCredit -eq 'y') {
$Postbody += "
#This post was generated using [Nerdblog.io's Mech Market Machine](http://nerdblog.io/archives/1223).
"
}
$Postbody | out-file $RedditOutput

Write-Host "
 ____ ____ ____ ____                          
||P |||o |||s |||t ||                         
||__|||__|||__|||__||                         
|/__\|/__\|/__\|/__\|                         
 ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||G |||e |||n |||e |||r |||a |||t |||e |||d ||
||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
"
start-sleep -s 1
Invoke-Item $RedditOutput