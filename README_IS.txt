MIMO er einfallt forritunarmál sem byggir á og er samhæft Morpho
Höfundur: Ólafur Óskar Egilsson, olioskar@gmail.com, ooe3@hi.is
(Meðfylgjandi er skráin morpho.jar, sem er forritunarmál eftir Snorra Agnarsson)

Þessi pakki inniheldur source skrár fyrir þýðandann - til að hann sé nothæfur þarf að byggja hann fyrst.

Sjá mimo_handbok.pdf fyrir frekari upplýsingar um þýðandann og virkni hans

LEIÐBEININGAR:
Miðað að því að unnið sé í linux umhverfi 
(með lítilli fyrirhöfn ætti að vera hægt að vinna með þetta í windows eða mac umhverfi)

Byaccj, Jflex (og Make) forritin þurfa að vera til staðar svo hægt sé að byggja þýðandann, einnig þarf java að vera uppsett.

Til að byggja þýðandan í linux umhverfi er nóg að keyra "make" í sömu möppu og þetta skjal.

Til að þýða og keyra prufuskrá er annaðhvort hægt að gefa skipunina "make test" 
en hún byggir þýðanda, 
þýðir prufuskrá yfir á Morpho vélamál,
þýðir morpho vélamálið yfir í morpho keyrslu skrá
og keyrir forritið.

Það eru 2 leiðir til að þýða og keyra Mimo forrit:
Nota shell-scripturnar "mimo" og "morpho"
./mimo forrit.mimo (þýðir forrit yfir á morpho vélamál og keyrsluhæfa morpho skrá)
./morpho forrit (keyrir forritið að morpho sýndarvélinni)

Eða að gera þetta handvirkt með java
java MimoParser forrit.mimo > forrit.masm (þýðir yfir á morpho vélamál)
java -jar morpho.jar -c forrit.masm (þýðir yfir í keyrsluhæft forrit fyrir morpho)
java -jar morho.jar forrit (keyrir forrit)

MEÐFYLGJANDI SKRÁR:
Makefile - Scripta fyrir make forritið
mimo.byaccj - Þýðandi
mimo.jflex - Lesgreinir
morpho - Linux shell script sem keyrir morpho
mimo - linux shell scripta sem keyrir Mimo (einungis nothæft eftir að hann hefur verið byggður)
morpho.jar - Morpho forritunarmálið
test.mimo- prufuskrá
README.txt - þessi skrá


