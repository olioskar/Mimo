MIMO er einfallt forritunarm�l sem byggir � og er samh�ft Morpho
H�fundur: �lafur �skar Egilsson, olioskar@gmail.com, ooe3@hi.is
(Me�fylgjandi er skr�in morpho.jar, sem er forritunarm�l eftir Snorra Agnarsson)

�essi pakki inniheldur source skr�r fyrir ���andann - til a� hann s� noth�fur �arf a� byggja hann fyrst.

Sj� mimo_handbok.pdf fyrir frekari uppl�singar um ���andann og virkni hans

LEI�BEININGAR:
Mi�a� a� �v� a� unni� s� � linux umhverfi 
(me� l�tilli fyrirh�fn �tti a� vera h�gt a� vinna me� �etta � windows e�a mac umhverfi)

Byaccj, Jflex (og Make) forritin �urfa a� vera til sta�ar svo h�gt s� a� byggja ���andann, einnig �arf java a� vera uppsett.

Til a� byggja ���andan � linux umhverfi er n�g a� keyra "make" � s�mu m�ppu og �etta skjal.

Til a� ���a og keyra prufuskr� er anna�hvort h�gt a� gefa skipunina "make test" 
en h�n byggir ���anda, 
���ir prufuskr� yfir � Morpho v�lam�l,
���ir morpho v�lam�li� yfir � morpho keyrslu skr�
og keyrir forriti�.

�a� eru 2 lei�ir til a� ���a og keyra Mimo forrit:
Nota shell-scripturnar "mimo" og "morpho"
./mimo forrit.mimo (���ir forrit yfir � morpho v�lam�l og keyrsluh�fa morpho skr�)
./morpho forrit (keyrir forriti� a� morpho s�ndarv�linni)

E�a a� gera �etta handvirkt me� java
java MimoParser forrit.mimo > forrit.masm (���ir yfir � morpho v�lam�l)
java -jar morpho.jar -c forrit.masm (���ir yfir � keyrsluh�ft forrit fyrir morpho)
java -jar morho.jar forrit (keyrir forrit)

ME�FYLGJANDI SKR�R:
Makefile - Scripta fyrir make forriti�
mimo.byaccj - ���andi
mimo.jflex - Lesgreinir
morpho - Linux shell script sem keyrir morpho
mimo - linux shell scripta sem keyrir Mimo (einungis noth�ft eftir a� hann hefur veri� bygg�ur)
morpho.jar - Morpho forritunarm�li�
test.mimo- prufuskr�
README.txt - �essi skr�


