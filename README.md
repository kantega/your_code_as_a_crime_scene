# Kantega Code Analyzer

Vi ønsker å tilby et verktøy for å angripe nye prosjekter.

* Steg 1:
Sjekk ut repoet.
* Steg 2: Kjør scriptet `source setup.sh` for å installere Kantega Code Analyzer. Da kan du kjøre kommandoen `kca_init` fra et hvilket som helst repo du vil analysere.

### Installasjon

Krever at man er på linux/mac eller kjører i Windows Subsystem for Linux (WSL) eller Git Bash på Windows.
```bash
source setup.sh
```


### Tilgjengelige kommandoer
* `kca_init` kjøres som første kommando i et nytt prosjekt. Den vil lage en gitlog-fil som brukes til videre analyse av prosjektet.

* `kca_hotspots` gir deg en liste over aktuelle **hotspots** i koden din. Hotspots er filer som er mye endret over tid.

* `kca_coupling` gir deg en oversikt over hvilke klasser/filer/moduler som henger tett sammen. Denne analysen baserer seg på hvilke deler av repoet som endrer seg samtidig.

* `kca_complexity` gir deg en oversikt over hvilke filer som har stor grad av kompleksitet, sammen med en oversikt over hvilke filer som endres mye.

