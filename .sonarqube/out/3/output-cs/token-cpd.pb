�?
ND:\Build\AzureDevOpsKats\src\AzureDevOpsKats.Web\Controllers\CatsController.cs
	namespace 	
AzureDevOpsKats
 
. 
Web 
. 
Controllers )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 

EnableCors 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
CatsController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ICatService $
_catService% 0
;0 1
private 
readonly 
IFileService %
_fileService& 2
;2 3
public!! 
CatsController!! 
(!! 
ICatService!! )

catService!!* 4
,!!4 5
IFileService!!6 B
fileService!!C N
,!!N O
IOptions!!P X
<!!X Y
ApplicationOptions!!Y k
>!!k l
settings!!m u
)!!u v
{"" 	
_catService## 
=## 

catService## $
??##% '
throw##( -
new##. 1!
ArgumentNullException##2 G
(##G H
nameof##H N
(##N O

catService##O Y
)##Y Z
)##Z [
;##[ \
_fileService$$ 
=$$ 
fileService$$ &
??$$' )
throw$$* /
new$$0 3!
ArgumentNullException$$4 I
($$I J
nameof$$J P
($$P Q
fileService$$Q \
)$$\ ]
)$$] ^
;$$^ _
ApplicationSettings%% 
=%%  !
settings%%" *
.%%* +
Value%%+ 0
;%%0 1
}&& 	
private(( 
ApplicationOptions(( "
ApplicationSettings((# 6
{((7 8
get((9 <
;((< =
set((> A
;((A B
}((C D
[.. 	
HttpGet..	 
].. 
[// 	
Produces//	 
(// 
$str// $
,//$ %
Type//& *
=//+ ,
typeof//- 3
(//3 4
IEnumerable//4 ?
<//? @
CatModel//@ H
>//H I
)//I J
)//J K
]//K L
public00 
IActionResult00 
Get00  
(00  !
)00! "
{11 	
var22 
results22 
=22 
_catService22 %
.22% &
GetCats22& -
(22- .
)22. /
;22/ 0
return33 
Ok33 
(33 
results33 
)33 
;33 
}44 	
[;; 	
HttpGet;;	 
(;; 
$str;; 
);; 
];; 
[<< 	
Produces<<	 
(<< 
$str<< $
,<<$ %
Type<<& *
=<<+ ,
typeof<<- 3
(<<3 4
CatModel<<4 <
)<<< =
)<<= >
]<<> ?
public== 
IActionResult== 
Get==  
(==  !
int==! $
id==% '
)==' (
{>> 	
var?? 
result?? 
=?? 
_catService?? $
.??$ %
GetCat??% +
(??+ ,
id??, .
)??. /
;??/ 0
if@@ 
(@@ 
result@@ 
==@@ 
null@@ 
)@@ 
returnAA 
NotFoundAA 
(AA  
)AA  !
;AA! "
returnCC 
OkCC 
(CC 
resultCC 
)CC 
;CC 
}DD 	
[KK 	

HttpDeleteKK	 
(KK 
$strKK 
)KK 
]KK 
publicLL 
IActionResultLL 
DeleteLL #
(LL# $
intLL$ '
idLL( *
)LL* +
{MM 	
varNN 
resultNN 
=NN 
_catServiceNN $
.NN$ %
GetCatNN% +
(NN+ ,
idNN, .
)NN. /
;NN/ 0
ifOO 
(OO 
resultOO 
==OO 
nullOO 
)OO 
returnPP 
NotFoundPP 
(PP  
)PP  !
;PP! "
_catServiceRR 
.RR 
	DeleteCatRR !
(RR! "
idRR" $
)RR$ %
;RR% &
_fileServiceSS 
.SS 

DeleteFileSS #
(SS# $
resultSS$ *
.SS* +
PhotoSS+ 0
)SS0 1
;SS1 2
returnUU 
	NoContentUU 
(UU 
)UU 
;UU 
}VV 	
[^^ 	
HttpPost^^	 
]^^ 
[__ 	
Consumes__	 
(__ 
$str__ $
,__$ %
$str__& ;
)__; <
]__< =
public`` 
IActionResult`` 
Post`` !
(``! "
[``" #
FromBody``# +
]``+ ,
CatCreateModel``- ;
value``< A
,``A B
	IFormFile``C L
file``M Q
)``Q R
{aa 	
ifbb 
(bb 
!bb 

ModelStatebb 
.bb 
IsValidbb #
)bb# $
{cc 
returndd 
newdd +
UnprocessableEntityObjectResultdd :
(dd: ;

ModelStatedd; E
)ddE F
;ddF G
}ee 
$"gg 
Bytes Exist:gg 
{gg 
valuegg  
.gg  !
Bytesgg! &
!=gg' )
nullgg* .
}gg. /
"gg/ 0
.gg0 1

ConsoleRedgg1 ;
(gg; <
)gg< =
;gg= >
$"hh 
File Exists:hh 
{hh 
filehh 
!=hh  "
nullhh# '
}hh' (
"hh( )
.hh) *

ConsoleRedhh* 4
(hh4 5
)hh5 6
;hh6 7
stringjj 
fileNamejj 
=jj 
$"jj  
{jj  !
Guidjj! %
.jj% &
NewGuidjj& -
(jj- .
)jj. /
}jj/ 0
.jpgjj0 4
"jj4 5
;jj5 6
varkk 
filePathkk 
=kk 
Pathkk 
.kk  
Combinekk  '
(kk' (
$"kk( *
{kk* +
Pathkk+ /
.kk/ 0
GetFullPathkk0 ;
(kk; <
ApplicationSettingskk< O
.kkO P
FileStoragekkP [
.kk[ \
RequestPathkk\ g
)kkg h
}kkh i
/kki j
{kkj k
fileNamekkk s
}kks t
"kkt u
)kku v
;kkv w
varmm 
catModelmm 
=mm 
newmm 
CatModelmm '
{nn 
Nameoo 
=oo 
valueoo 
.oo 
Nameoo !
,oo! "
Descriptionpp 
=pp 
valuepp #
.pp# $
Descriptionpp$ /
,pp/ 0
Photoqq 
=qq 
fileNameqq  
,qq  !
}rr 
;rr 
returnww 
Okww 
(ww 
)ww 
;ww 
}xx 	
[
�� 	
HttpPut
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
IActionResult
�� 
Put
��  
(
��  !
int
��! $
id
��% '
,
��' (
[
��) *
FromBody
��* 2
]
��2 3
CatUpdateModel
��4 B
value
��C H
)
��H I
{
�� 	
if
�� 
(
�� 
value
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
}
�� 
_catService
�� 
.
�� 
EditCat
�� 
(
��  
id
��  "
,
��" #
value
��$ )
)
��) *
;
��* +
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
MD:\Build\AzureDevOpsKats\src\AzureDevOpsKats.Web\Helpers\ConsoleExtensions.cs
	namespace 	
AzureDevOpsKats
 
. 
Web 
. 
Helpers %
{ 
public 

static 
class 
ConsoleExtensions )
{ 
[ 	
DebuggerStepThrough	 
] 
public 
static 
void 
ConsoleGreen '
(' (
this( ,
string- 3
text4 8
)8 9
{ 	
text 
. 
ColoredWriteLine !
(! "
ConsoleColor" .
.. /
Green/ 4
)4 5
;5 6
} 	
[ 	
DebuggerStepThrough	 
] 
public 
static 
void 

ConsoleRed %
(% &
this& *
string+ 1
text2 6
)6 7
{ 	
text 
. 
ColoredWriteLine !
(! "
ConsoleColor" .
.. /
Red/ 2
)2 3
;3 4
} 	
[   	
DebuggerStepThrough  	 
]   
public!! 
static!! 
void!! 
ConsoleYellow!! (
(!!( )
this!!) -
string!!. 4
text!!5 9
)!!9 :
{"" 	
text## 
.## 
ColoredWriteLine## !
(##! "
ConsoleColor##" .
.##. /
Yellow##/ 5
)##5 6
;##6 7
}$$ 	
[++ 	
DebuggerStepThrough++	 
]++ 
public,, 
static,, 
void,, 
ColoredWriteLine,, +
(,,+ ,
this,,, 0
string,,1 7
text,,8 <
,,,< =
ConsoleColor,,> J
color,,K P
),,P Q
{-- 	
Console.. 
... 
ForegroundColor.. #
=..$ %
color..& +
;..+ ,
Console// 
.// 
	WriteLine// 
(// 
text// "
)//" #
;//# $
Console00 
.00 

ResetColor00 
(00 
)00  
;00  !
}11 	
}22 
}33 �
;D:\Build\AzureDevOpsKats\src\AzureDevOpsKats.Web\Program.cs
	namespace 	
AzureDevOpsKats
 
. 
Web 
{ 
public 

class 
Program 
{ 
public 
static 
IConfiguration $
Configuration% 2
{3 4
get5 8
;8 9
}: ;
=< =
new> A 
ConfigurationBuilderB V
(V W
)W X
. 
SetBasePath 
( 
	Directory "
." #
GetCurrentDirectory# 6
(6 7
)7 8
)8 9
. 
AddJsonFile 
( 
$str +
,+ ,
optional- 5
:5 6
false7 <
,< =
reloadOnChange> L
:L M
falseN S
)S T
. 
AddJsonFile 
( 
$" 
appsettings. '
{' (
Environment( 3
.3 4"
GetEnvironmentVariable4 J
(J K
$strK c
)c d
??e g
$strh u
}u v
.jsonv {
"{ |
,| }
optional	~ �
:
� �
true
� �
)
� �
. 
Build 
( 
) 
; 
public 
static 
int 
Main 
( 
string %
[% &
]& '
args( ,
), -
{ 	
try 
{  
CreateWebHostBuilder   $
(  $ %
args  % )
)  ) *
.  * +
Build  + 0
(  0 1
)  1 2
.  2 3
Run  3 6
(  6 7
)  7 8
;  8 9
return!! 
$num!! 
;!! 
}"" 
catch## 
(## 
	Exception## 
)## 
{$$ 
return%% 
$num%% 
;%% 
}&& 
}'' 	
public.. 
static.. 
IWebHostBuilder.. % 
CreateWebHostBuilder..& :
(..: ;
string..; A
[..A B
]..B C
args..D H
)..H I
=>..J L
WebHost// 
.//  
CreateDefaultBuilder// (
(//( )
args//) -
)//- .
.00 
UseConfiguration00 !
(00! "
Configuration00" /
)00/ 0
.11 

UseStartup11 
<11 
Startup11 #
>11# $
(11$ %
)11% &
;11& '
}22 
}33 �W
;D:\Build\AzureDevOpsKats\src\AzureDevOpsKats.Web\Startup.cs
	namespace 	
AzureDevOpsKats
 
. 
Web 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public$$ 
IConfiguration$$ 
Configuration$$ +
{$$, -
get$$. 1
;$$1 2
}$$3 4
public** 
void** 
ConfigureServices** %
(**% &
IServiceCollection**& 8
services**9 A
)**A B
{++ 	
services-- 
.-- 

AddOptions-- 
(--  
)--  !
;--! "
services.. 
... 
	Configure.. 
<.. 
ApplicationOptions.. 1
>..1 2
(..2 3
Configuration..3 @
)..@ A
;..A B
services// 
.// 
AddSingleton// !
(//! "
Configuration//" /
)/// 0
;//0 1
var00 
config00 
=00 
Configuration00 &
.00& '
Get00' *
<00* +
ApplicationOptions00+ =
>00= >
(00> ?
)00? @
;00@ A#
AutoMapperConfiguration22 #
.22# $
	Configure22$ -
(22- .
)22. /
;22/ 0
var44 
dbConnection44 
=44 
Configuration44 ,
.44, -
GetConnectionString44- @
(44@ A
$str44A O
)44O P
;44P Q
string55 

connection55 
=55 
$"55  "
Data Source=55" .
{55. /
Path55/ 3
.553 4
GetFullPath554 ?
(55? @
Path55@ D
.55D E
Combine55E L
(55L M
	Directory55M V
.55V W
GetCurrentDirectory55W j
(55j k
)55k l
,55l m
dbConnection55n z
)55z {
)55{ |
}55| }
;55} ~
"55~ 
;	55 �
string77 

imagesRoot77 
=77 
Path77  $
.77$ %
Combine77% ,
(77, -
	Directory77- 6
.776 7
GetCurrentDirectory777 J
(77J K
)77K L
,77L M
config77N T
.77T U
FileStorage77U `
.77` a
FilePath77a i
)77i j
;77j k
services88 
.88 
AddSingleton88 !
<88! "
IFileService88" .
>88. /
(88/ 0
new880 3
FileService884 ?
(88? @

imagesRoot88@ J
)88J K
)88K L
;88L M
services:: 
.:: 
AddSingleton:: !
<::! "
ICatRepository::" 0
>::0 1
(::1 2
new::2 5
CatRepository::6 C
(::C D

connection::D N
)::N O
)::O P
;::P Q
services;; 
.;; 
	AddScoped;; 
<;; 
ICatService;; *
,;;* +

CatService;;, 6
>;;6 7
(;;7 8
);;8 9
;;;9 :
services>> 
.>> 
AddCustomSwagger>> %
(>>% &
Configuration>>& 3
)>>3 4
;>>4 5
services@@ 
.@@ 
AddCors@@ 
(@@ 
options@@ $
=>@@% '
options@@( /
.@@/ 0
	AddPolicy@@0 9
(@@9 :
$str@@: D
,@@D E
p@@F G
=>@@H J
p@@K L
.@@L M
AllowAnyOrigin@@M [
(@@[ \
)@@\ ]
.AA 
AllowAnyMethodAA 
(AA  
)AA  !
.BB 
AllowAnyHeaderBB 
(BB  
)BB  !
)BB! "
)BB" #
;BB# $
servicesDD 
.DD 
	ConfigureDD 
<DD 
CookiePolicyOptionsDD 2
>DD2 3
(DD3 4
optionsDD4 ;
=>DD< >
{EE 
optionsFF 
.FF 
CheckConsentNeededFF *
=FF+ ,
contextFF- 4
=>FF5 7
trueFF8 <
;FF< =
optionsGG 
.GG !
MinimumSameSitePolicyGG -
=GG. /
SameSiteModeGG0 <
.GG< =
NoneGG= A
;GGA B
}HH 
)HH 
;HH 
servicesJJ 
.JJ 
AddMvcJJ 
(JJ 
)JJ 
.JJ #
SetCompatibilityVersionJJ 5
(JJ5 6 
CompatibilityVersionJJ6 J
.JJJ K
Version_2_1JJK V
)JJV W
;JJW X
}KK 	
publicRR 
voidRR 
	ConfigureRR 
(RR 
IApplicationBuilderRR 1
appRR2 5
,RR5 6
IHostingEnvironmentRR7 J
envRRK N
)RRN O
{SS 	
varTT 
configTT 
=TT 
ConfigurationTT &
.TT& '
GetTT' *
<TT* +
ApplicationOptionsTT+ =
>TT= >
(TT> ?
)TT? @
;TT@ A
ifVV 
(VV 
envVV 
.VV 
IsDevelopmentVV !
(VV! "
)VV" #
)VV# $
{WW 
appXX 
.XX %
UseDeveloperExceptionPageXX -
(XX- .
)XX. /
;XX/ 0
}YY 
elseZZ 
{[[ 
app\\ 
.\\ 
UseExceptionHandler\\ '
(\\' (
$str\\( 0
)\\0 1
;\\1 2
}]] 
ConfigureSwagger__ 
(__ 
app__  
)__  !
;__! " 
ConfigureFileBrowser``  
(``  !
app``! $
)``$ %
;``% &
appbb 
.bb 
UseCookiePolicybb 
(bb  
)bb  !
;bb! "
appcc 
.cc 
UseMvccc 
(cc 
)cc 
;cc 
}dd 	
privateff 
voidff 
ConfigureSwaggerff %
(ff% &
IApplicationBuilderff& 9
appff: =
)ff= >
{gg 	
apphh 
.hh 

UseSwaggerhh 
(hh 
)hh 
;hh 
appii 
.ii 
UseSwaggerUIii 
(ii 
cii 
=>ii !
{jj 
ckk 
.kk 
SwaggerEndpointkk !
(kk! "
$strkk" <
,kk< =
$strkk> V
)kkV W
;kkW X
}ll 
)ll 
;ll 
}mm 	
privateoo 
voidoo  
ConfigureFileBrowseroo )
(oo) *
IApplicationBuilderoo* =
appoo> A
)ooA B
{pp 	
varqq 
configqq 
=qq 
Configurationqq &
.qq& '
Getqq' *
<qq* +
ApplicationOptionsqq+ =
>qq= >
(qq> ?
)qq? @
;qq@ A
DefaultFilesOptionsss 
optionsss  '
=ss( )
newss* -
DefaultFilesOptionsss. A
(ssA B
)ssB C
;ssC D
optionstt 
.tt 
DefaultFileNamestt $
.tt$ %
Cleartt% *
(tt* +
)tt+ ,
;tt, -
optionsuu 
.uu 
DefaultFileNamesuu $
.uu$ %
Adduu% (
(uu( )
$struu) 5
)uu5 6
;uu6 7
appvv 
.vv 
UseDefaultFilesvv 
(vv  
optionsvv  '
)vv' (
;vv( )
appww 
.ww 
UseStaticFilesww 
(ww 
)ww  
;ww  !
appxx 
.xx 
UseStaticFilesxx 
(xx 
newxx "
StaticFileOptionsxx# 4
{yy 
FileProviderzz 
=zz 
newzz " 
PhysicalFileProviderzz# 7
(zz7 8
Path{{ 
.{{ 
Combine{{  
({{  !
	Directory{{! *
.{{* +
GetCurrentDirectory{{+ >
({{> ?
){{? @
,{{@ A
config{{B H
.{{H I
FileStorage{{I T
.{{T U
FilePath{{U ]
){{] ^
){{^ _
,{{_ `
RequestPath|| 
=|| 
config|| $
.||$ %
FileStorage||% 0
.||0 1
RequestPath||1 <
}}} 
)}} 
;}} 
}~~ 	
} 
internal
�� 
static
�� 
class
�� )
ServiceCollectionExtensions
�� 5
{
�� 
public
�� 
static
��  
IServiceCollection
�� (
AddCustomSwagger
��) 9
(
��9 :
this
��: > 
IServiceCollection
��? Q
services
��R Z
,
��Z [
IConfiguration
�� 
configuration
�� (
)
��( )
{
�� 	
services
�� 
.
�� 
AddSwaggerGen
�� "
(
��" #
options
��# *
=>
��+ -
{
�� 
options
�� 
.
�� 

SwaggerDoc
�� "
(
��" #
$str
��# '
,
��' (
new
��) ,
Info
��- 1
{
�� 
Title
�� 
=
�� 
$str
�� 1
,
��1 2
Description
�� 
=
��  !
$str
��" 7
,
��7 8
Version
�� 
=
�� 
$str
�� "
,
��" #
TermsOfService
�� "
=
��# $
$str
��% +
,
��+ ,
}
�� 
)
�� 
;
�� 
options
�� 
.
��  
IncludeXmlComments
�� *
(
��* + 
GetXmlCommentsPath
��+ =
(
��= >
)
��> ?
)
��? @
;
��@ A
}
�� 
)
�� 
;
�� 
return
�� 
services
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
string
��  
GetXmlCommentsPath
�� 0
(
��0 1
)
��1 2
{
�� 	
var
�� 
basePath
�� 
=
�� 

AppContext
�� %
.
��% &
BaseDirectory
��& 3
;
��3 4
var
�� 
assemblyName
�� 
=
�� 
System
�� %
.
��% &

Reflection
��& 0
.
��0 1
Assembly
��1 9
.
��9 :
GetEntryAssembly
��: J
(
��J K
)
��K L
.
��L M
GetName
��M T
(
��T U
)
��U V
.
��V W
Name
��W [
;
��[ \
var
�� 
fileName
�� 
=
�� 
Path
�� 
.
��  
GetFileName
��  +
(
��+ ,
assemblyName
��, 8
+
��9 :
$str
��; A
)
��A B
;
��B C
return
�� 
Path
�� 
.
�� 
Combine
�� 
(
��  
basePath
��  (
,
��( )
fileName
��* 2
)
��2 3
;
��3 4
}
�� 	
}
�� 
}�� 