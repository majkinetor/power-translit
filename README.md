power-translit
==============

Skript omogućava transliteraciju ćirilica <-> latinica.

Preduslovi
----------

- Powershell 3+


Korišćenje
----------

- Fajlove `translit.ps1` i `serbian` iskopirati na istu lokaciju
- Funkcija `translit` radi transliteraciju. Podrazumevana direkcija je cyr -> lat

~~~

. ./translit.ps1

translit -To cyr 'nešto na latinici'
translit 'нешто на ћирилици'

~~~
