RandomTask: Kasutusjuhend algajale
Tere! See on väike abimees, mis annab sulle harjutamiseks juhuslikke PowerShelli programmeerimisülesandeid. Sa ei pea olema IT-guru, et seda tööle panna – järgi lihtsalt neid kolme sammu.
SAMM 1: Leia moodulile koht
Laadi alla (või kopeeri) kaust nimega RandomTask. Selles kaustas peavad olema failid nagu RandomTask.psd1 ja kaust Data.

Pane see kaust kuskile, kust sa selle kergesti üles leiad. Näiteks: Töölauale (Desktop) või kausta Dokumendid (Documents). (Täpsem asukoht ei ole oluline, peaasi, et sa ise tead, kus see on).

SAMM 2: Tee PowerShell lahti ja laadi moodul sisse
Vajuta Windowsi klahvi, trüki sisse PowerShell ja ava see. Sulle vaatab vastu sinine (või must) aken.

Nüüd peame PowerShellile ütlema, kus sinu uus tööriist asub. Selleks trüki sisse järgmine käsk ja vajuta Enter. (Asenda failitee sellega, kuhu sa kausta päriselt panid!)
Import-Module "C:\Sinu\Tee\Asukohani\E-Oppe\RandomTask.psd1"

SAMM 3: Hakka ülesandeid lahendama!
Nüüd on tööriist valmis. Sa saad sellega rääkida, kasutades käsku Get-RandomTask. Siin on kõige kasulikumad käsud, mida saad terminali trükkida (pärast iga käsku vajuta Enter):
A) Anna mulle suvaline ülesanne (kõige lihtsam käsk): "Get-RandomTask"

B) Tee tekst ilusaks ja anna mulle vihje ka!(Seda on kõige mugavam silmaga lugeda)
Get-RandomTask -AsText -IncludeHint
C) Tahan ainult KERGEMAID ülesandeid (raskusaste 1 kuni 2):
Get-RandomTask -MaxDifficulty 2 -AsText
D) Tahan harjutada kindlat teemat (näiteks "loops" ehk tsüklid):
Get-RandomTask -Topic loops -AsText
(Valida saad nende teemade vahel: loops, functions, strings, files, OOP, arrays, objects).


Midagi läks valesti? (Veaotsing)

VIGA: Punane kiri ütleb, et skriptide käivitamine on keelatud ("scripts is disabled"). Lahendus: Sinu arvuti on liiga turvalises režiimis. Kirjuta PowerShellis see käsk ja vajuta Enter: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser (Kui küsitakse kinnitust, vajuta Y ja Enter).
VIGA: Kollane kiri "Ühtegi ülesannet antud filtritega ei leitud." Lahendus: Sa küsisid midagi, mida andmebaasis pole. Näiteks raskusastet 5 teemal, kus on ainult kerged ülesanded. Proovi otsingut laiendada, jättes osad filtrid (nagu -Topic või -MaxDifficulty) ära.

Head lahendamist! Kui jääd hätta, küsi julgelt lisaülesandeid uuesti käivitades Get-RandomTask!