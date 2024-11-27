# Kantega Code Analyzer

Vi ønsker å tilby et verktøy for å angripe nye prosjekter.

* Steg 1:
Sjekk ut repoet.
* Steg 2: Kjør scriptet `setup.sh` for å installere Kantega Code Analyzer. Da kan du kjøre kommandoen `kca` fra et hvilket som helst repo du vil analysere.

### Tilgjengelige kommandoer
* `kca init` kjøres som første kommando i et nytt prosjekt. Den vil lage en gitlog-fil som brukes til videre analyse av prosjektet.

* `kca hotspots` gir deg en liste over aktuelle **hotspots** i koden din. Hotspots er filer som er mye endret over tid.

* `kca coupling` gir deg en oversikt over hvilke klasser/filer/moduler som henger tett sammen. Denne analysen baserer seg på hvilke deler av repoet som endrer seg samtidig.

