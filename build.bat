set epic="C:\Program Files (x86)\Epidata\epic.exe"
set epidata="C:\Program Files (x86)\Epidata\epidata.exe"

cd /d src\epidata

echo . > "facility.rec"
echo . > "field interviewer.rec"
echo . > "field supervisor.rec"
echo . > "office editor.rec"
echo . > "office keyer.rec"
echo . > "occupation.rec"
echo . > "household.rec"
echo . > "household member.rec"
echo . > "eligible man.rec"
echo . > "eligible woman.rec"

%epic% rev "facility.qes"           "facility.rec"          AUTO FORCE
%epic% rev "field interviewer.qes"  "field interviewer.rec" AUTO FORCE
%epic% rev "field supervisor.qes"   "field supervisor.rec"  AUTO FORCE
%epic% rev "office editor.qes"      "office editor.rec"     AUTO FORCE
%epic% rev "office keyer.qes"       "office keyer.rec"      AUTO FORCE
%epic% rev "occupation.qes"         "occupation.rec"        AUTO FORCE
%epic% rev "household.qes"          "household.rec"         AUTO FORCE
%epic% rev "household member.qes"   "household member.rec"  AUTO FORCE
%epic% rev "eligible man.qes"       "eligible man.rec"      AUTO FORCE
%epic% rev "eligible woman.qes"     "eligible woman.rec"    AUTO FORCE

%epic% import TXT "facility.csv"          "facility.rec"          qes="facility.qes"          delim=; q=none replace
%epic% import TXT "field interviewer.csv" "field interviewer.rec" qes="field interviewer.qes" delim=; q=none replace
%epic% import TXT "field supervisor.csv"  "field supervisor.rec"  qes="field supervisor.qes"  delim=; q=none replace
%epic% import TXT "office editor.csv"     "office editor.rec"     qes="office editor.qes"     delim=; q=none replace
%epic% import TXT "office keyer.csv"      "office keyer.rec"      qes="office keyer.qes"      delim=; q=none replace
%epic% import TXT "occupation.csv"        "occupation.rec"        qes="occupation.qes"        delim=; q=none replace
%epic% import TXT "household.csv"         "household.rec"         qes="household.qes"         delim=; q=none replace
%epic% import TXT "household member.csv"  "household member.rec"  qes="household member.qes"  delim=; q=none replace
%epic% import TXT "eligible woman.csv"    "eligible woman.rec"    qes="eligible woman.qes"    delim=; q=none replace
%epic% import TXT "eligible man.csv"      "eligible man.rec"      qes="eligible man.qes"      delim=; q=none replace

echo start "" %epidata% "facility.rec" > "..\..\build\facility.bat"
echo start "" %epidata% "field interviewer.rec" > "..\..\build\field interviewer.bat" 
echo start "" %epidata% "field supervisor.rec" > "..\..\build\field supervisor.bat"
echo start "" %epidata% "office editor.rec" > "..\..\build\office editor.bat"
echo start "" %epidata% "office keyer.rec" > "..\..\build\office keyer.bat"
echo start "" %epidata% "occupation.rec" > "..\..\build\occupation.bat"
echo start "" %epidata% "household.rec" > "..\..\build\household.bat"

del  ..\..\build\*.eix

del  *.old.rec
copy *.chk ..\..\build
move *.rec ..\..\build

pause