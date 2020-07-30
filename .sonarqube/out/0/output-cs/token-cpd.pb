Ý
8/Users/christophehavard/Sonar/Repos/gh_netcore/Helper.cs
	namespace 	
	Surfrider
 
{ 
public 
static 
class 
Helper 
{ 
private

 
static

 
string

 '
GetKeyVaultConnectionString

 9
(

9 :
string

: @

secretName

A K
)

K L
{ 	
string 
keyVaultName 
=  !
Environment" -
.- ."
GetEnvironmentVariable. D
(D E
$strE U
)U V
;V W
var 
kvUri 
= 
$str "
+# $
keyVaultName% 1
+2 3
$str4 F
;F G
var 
client 
= 
new 
SecretClient )
() *
new* -
Uri. 1
(1 2
kvUri2 7
)7 8
,8 9
new: ="
DefaultAzureCredential> T
(T U
)U V
)V W
;W X
KeyVaultSecret 
secret !
=" #
client$ *
.* +
	GetSecret+ 4
(4 5

secretName5 ?
)? @
;@ A
return 
secret 
. 
Value 
;  
} 	
public 
static 
string 
GetConnectionString 0
(0 1
)1 2
{ 	
return 
$str Q
;Q R
} 	
public 
static 
void 
	DoNothing $
($ %
)% &
{& '
Environment 
. "
GetEnvironmentVariable .
(. /
$str/ C
)C D
;D E
} 	
} 
} ¯
;/Users/christophehavard/Sonar/Repos/gh_netcore/IDatabase.cs
	namespace 	
	Surfrider
 
{ 
public 

	interface 
	IDatabase 
{		 
Task

 
<

 
int

 
>

 
ExecuteNonQuery

 !
(

! "
string

" (
query

) .
,

. /
IDictionary

0 ;
<

; <
string

< B
,

B C
object

D J
>

J K
args

L P
=

Q R
null

S W
)

W X
;

X Y
Task 
< 
string 
> 
ExecuteStringQuery '
(' (
string( .
query/ 4
,4 5
IDictionary6 A
<A B
stringB H
,H I
objectJ P
>P Q
argsR V
=W X
nullY ]
)] ^
;^ _
} 
} ê
A/Users/christophehavard/Sonar/Repos/gh_netcore/OperationStatus.cs
	namespace 	
	Surfrider
 
. 
Jobs 
. 
	Recurring "
{ 
public 

enum 
OperationStatus 
{  !
OK 

= 
$num 
, 
WARNING 
= 
$num 
, 
ERROR 
= 
$num 
} 
} û 
A/Users/christophehavard/Sonar/Repos/gh_netcore/PostgreDatabase.cs
	namespace 	
	Surfrider
 
{ 
public		 

class		 
PostgreDatabase		  
:		! "
	IDatabase		# ,
{

 
string 
ConnectionString 
;  
public 
PostgreDatabase 
( 
string %
connectionString& 6
)6 7
{ 	
this 
. 
ConnectionString !
=" #
connectionString$ 4
;4 5
} 	
public 
async 
Task 
< 
int 
> 
ExecuteNonQuery .
(. /
string/ 5
query6 ;
,; <
IDictionary= H
<H I
stringI O
,O P
objectQ W
>W X
argsY ]
=^ _
null` d
)d e
{ 	
using 
( 
var 
conn 
= 
new !
NpgsqlConnection" 2
(2 3
ConnectionString3 C
)C D
)D E
{ 
conn 
. 
Open 
( 
) 
; 
using 
( 
var 
cmd 
=  
new! $
NpgsqlCommand% 2
(2 3
)3 4
)4 5
{ 
cmd 
. 

Connection "
=# $
conn% )
;) *
cmd 
. 
CommandText #
=$ %
query& +
;+ ,
foreach 
( 
var 
arg  #
in$ &
args' +
)+ ,
{, -
cmd 
. 

Parameters &
.& '
AddWithValue' 3
(3 4
arg4 7
.7 8
Key8 ;
,; <
arg= @
.@ A
ValueA F
)F G
;G H
} 
return 
await  
cmd! $
.$ % 
ExecuteNonQueryAsync% 9
(9 :
): ;
;; <
} 
} 
}   	
public"" 
async"" 
Task"" 
<"" 
string""  
>""  !
ExecuteStringQuery""" 4
(""4 5
string""5 ;
query""< A
,""A B
IDictionary""C N
<""N O
string""O U
,""U V
object""W ]
>""] ^
args""_ c
=""d e
null""f j
)""j k
{## 	
string$$ 
res$$ 
=$$ 
string$$ 
.$$  
Empty$$  %
;$$% &
using%% 
(%% 
var%% 
conn%% 
=%% 
new%% !
NpgsqlConnection%%" 2
(%%2 3
ConnectionString%%3 C
)%%C D
)%%D E
{&& 
conn'' 
.'' 
Open'' 
('' 
)'' 
;'' 
using(( 
((( 
var(( 
cmd(( 
=((  
new((! $
NpgsqlCommand((% 2
(((2 3
)((3 4
)((4 5
{)) 
cmd** 
.** 

Connection** "
=**# $
conn**% )
;**) *
cmd++ 
.++ 
CommandText++ #
=++$ %
query++& +
;+++ ,
using,, 
(,, 
var,, 
reader,, %
=,,& '
await,,( -
cmd,,. 1
.,,1 2
ExecuteReaderAsync,,2 D
(,,D E
),,E F
),,F G
{-- 
while.. 
(.. 
reader.. %
...% &
Read..& *
(..* +
)..+ ,
).., -
{// 
res00 
+=00  "
reader00# )
.00) *
	GetString00* 3
(003 4
$num004 5
)005 6
;006 7
}11 
}22 
}33 
}44 
return55 
res55 
;55 
}66 	
}77 
}88 ±O
E/Users/christophehavard/Sonar/Repos/gh_netcore/PowerBIFillDatabase.cs
	namespace 	
	Surfrider
 
. 
Jobs 
. 
	Recurring "
{		 
public

 

static

 
class

 
PowerBIFillDatabase

 +
{ 
public 
static 
	IDatabase 
Database  (
;( )
private 
static 
string 
ListOfCampaignsIds 0
;0 1
[ 	
FunctionName	 
( 
$str +
)+ ,
], -
public 
static 
async 
Task  
Run! $
($ %
[% &
TimerTrigger& 2
(2 3
$str3 @
)@ A
]A B
	TimerInfoB K
myTimerL S
,S T
ILoggerU \
logger] c
)c d
{ 	
Console 
. 
	WriteLine 
( 
$str &
+' (
Helper) /
./ 0
GetConnectionString0 C
(C D
)D E
)E F
;F G
Database 
= 
new 
PostgreDatabase *
(* +
Helper+ 1
.1 2
GetConnectionString2 E
(E F
)F G
)G H
;H I
var 
	startedOn 
= 
DateTime $
.$ %
Now% (
;( )
IList 
< 
Guid 
> 
newCampaignsIds '
=( )
new* -
List. 2
<2 3
Guid3 7
>7 8
(8 9
)9 :
;: ;
newCampaignsIds 
. 
Add 
(  
new  #
Guid$ (
(( )
$str) O
)O P
)P Q
;Q R
newCampaignsIds 
. 
Add 
(  
new  #
Guid$ (
(( )
$str) O
)O P
)P Q
;Q R
ListOfCampaignsIds!! 
=!!  
FormatGuidsForSQL!!! 2
(!!2 3
newCampaignsIds!!3 B
)!!B C
;!!C D
await## 
ExecuteScript## 
(##  
$str##  V
)##V W
;##W X
await$$ 
ExecuteScript$$ 
($$  
$str$$  H
)$$H I
;$$I J
await%% 
ExecuteScript%% 
(%%  
$str%%  X
)%%X Y
;%%Y Z
await&& 
ExecuteScript&& 
(&&  
$str&&  N
)&&N O
;&&O P
await'' 
ExecuteScript'' 
(''  
$str''  F
)''F G
;''G H
await(( 
ExecuteScript(( 
(((  
$str((  E
)((E F
;((F G
await)) 
ExecuteScript)) 
())  
$str))  K
)))K L
;))L M
await** 
ExecuteScript** 
(**  
$str**  F
)**F G
;**G H
Console11 
.11 
	WriteLine11 
(11 
$str11 S
)11S T
;11T U
}33 	
private55 
static55 
string55 
FormatGuidsForSQL55 /
(55/ 0
IList550 5
<555 6
Guid556 :
>55: ;
newCampaignsIds55< K
)55K L
{66 	
var77 
res77 
=77 
$str77 
;77 
for88 
(88 
int88 
i88 
=88 
$num88 
;88 
i88 
<88 
newCampaignsIds88 .
.88. /
Count88/ 4
;884 5
i886 7
++887 9
)889 :
{88: ;
res:: 
+=:: 
$str:: 
+:: 
newCampaignsIds:: ,
[::, -
i::- .
]::. /
+::0 1
$str::2 5
;::5 6
if;; 
(;; 
i;; 
<;; 
newCampaignsIds;; &
.;;& '
Count;;' ,
-;;- .
$num;;/ 0
);;0 1
res<< 
+=<< 
$str<< 
;<< 
}== 
return>> 
res>> 
;>> 
}?? 	
privateAA 
staticAA 
asyncAA 
TaskAA !
CleanErrorsAA" -
(AA- .
)AA. /
{BB 	
}DD 	
privateFF 
staticFF 
asyncFF 
TaskFF !
ExecuteScriptFF" /
(FF/ 0
stringFF0 6

scriptPathFF7 A
)FFA B
{FFB C
varGG 
commandGG 
=GG 
SystemGG  
.GG  !
IOGG! #
.GG# $
FileGG$ (
.GG( )
ReadAllTextGG) 4
(GG4 5

scriptPathGG5 ?
)GG? @
;GG@ A
commandHH 
=HH 
commandHH 
.HH 
ReplaceHH %
(HH% &
$strHH& 5
,HH5 6
ListOfCampaignsIdsHH7 I
)HHI J
;HHJ K
awaitII 
DatabaseII 
.II 
ExecuteNonQueryII *
(II* +
commandII+ 2
)II2 3
;II3 4
}JJ 	
privateLL 
staticLL 
asyncLL 
TaskLL !
	InsertLogLL" +
(LL+ ,
DateTimeLL, 4
	startedOnLL5 >
,LL> ?
OperationStatusLL@ O
statusLLP V
,LLV W
ILoggerLLX _
logLL` c
)LLc d
{MM 	
varNN 

finishedOnNN 
=NN 
DateTimeNN %
.NN% &
NowNN& )
;NN) *
varOO 
elapsedTimeOO 
=OO 

finishedOnOO (
-OO) *
	startedOnOO+ 4
;OO4 5
varQQ 
commandQQ 
=QQ 
$"QQ \
PINSERT INTO bi.Logs VALUES (@id, @startedOn, @finishedOn, @elapsedTime, @status)QQ l
"QQl m
;QQm n
IDictionaryRR 
<RR 
stringRR 
,RR 
objectRR  &
>RR& '
argsRR( ,
=RR- .
newRR/ 2

DictionaryRR3 =
<RR= >
stringRR> D
,RRD E
objectRRF L
>RRL M
(RRM N
)RRN O
;RRO P
argsSS 
.SS 
AddSS 
(SS 
$strSS 
,SS 
GuidSS  
.SS  !
NewGuidSS! (
(SS( )
)SS) *
)SS* +
;SS+ ,
argsTT 
.TT 
AddTT 
(TT 
$strTT !
,TT! "
	startedOnTT# ,
)TT, -
;TT- .
argsUU 
.UU 
AddUU 
(UU 
$strUU "
,UU" #

finishedOnUU$ .
)UU. /
;UU/ 0
argsVV 
.VV 
AddVV 
(VV 
$strVV #
,VV# $
elapsedTimeVV% 0
.VV0 1
TotalSecondsVV1 =
)VV= >
;VV> ?
argsWW 
.WW 
AddWW 
(WW 
$strWW 
,WW 
statusWW  &
.WW& '
ToStringWW' /
(WW/ 0
)WW0 1
)WW1 2
;WW2 3
awaitXX 
DatabaseXX 
.XX 
ExecuteNonQueryXX *
(XX* +
commandXX+ 2
,XX2 3
argsXX4 8
)XX8 9
;XX9 :
}YY 	
private[[ 
static[[ 
async[[ 
Task[[ !
<[[! "
IList[[" '
<[[' (
Guid[[( ,
>[[, -
>[[- . 
RetrieveNewCampaigns[[/ C
([[C D
ILogger[[D K
log[[L O
)[[O P
{\\ 	
IList^^ 
<^^ 
Guid^^ 
>^^ 
	campaigns^^ !
=^^" #
new^^$ '
List^^( ,
<^^, -
Guid^^- 1
>^^1 2
(^^2 3
)^^3 4
;^^4 5
var__ 

current_ts__ 
=__ 
new__  
DateTime__! )
(__) *
$num__* .
,__. /
$num__0 2
,__2 3
$num__4 6
)__6 7
;__7 8
var`` 
command`` 
=`` 
$"`` B
6SELECT id FROM campaign.campaign WHERE createdon >=  '`` R
{``R S

current_ts``S ]
}``] ^
'``^ _
"``_ `
;``` a
usingaa 
(aa 
varaa 
connaa 
=aa 
newaa !
NpgsqlConnectionaa" 2
(aa2 3
Helperaa3 9
.aa9 :
GetConnectionStringaa: M
(aaM N
)aaN O
)aaO P
)aaP Q
{bb 
conncc 
.cc 
Opencc 
(cc 
)cc 
;cc  
usingdd 
(dd 
vardd 
cmddd "
=dd# $
newdd% (
NpgsqlCommanddd) 6
(dd6 7
)dd7 8
)dd8 9
{ee 
cmdff 
.ff 

Connectionff &
=ff' (
connff) -
;ff- .
cmdgg 
.gg 
CommandTextgg '
=gg( )
commandgg* 1
;gg1 2
usinghh 
(hh 
varhh "
readerhh# )
=hh* +
awaithh, 1
cmdhh2 5
.hh5 6
ExecuteReaderAsynchh6 H
(hhH I
)hhI J
)hhJ K
{ii 
whilekk !
(kk" #
readerkk# )
.kk) *
Readkk* .
(kk. /
)kk/ 0
)kk0 1
{ll 
	campaignsmm  )
.mm) *
Addmm* -
(mm- .
readermm. 4
.mm4 5
GetFieldValuemm5 B
<mmB C
GuidmmC G
>mmG H
(mmH I
$nummmI J
)mmJ K
)mmK L
;mmL M
}nn 
}pp 
}qq 
}rr 
returntt 
	campaignstt 
;tt 
}uu 	
}xx 
}zz 