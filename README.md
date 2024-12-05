# Kantega Code Analyzer

## OBS: Dette er et eksperimentelt verktøy og er under utvikling. Vennligst lag en issue eller kontakt oss om du har spørsmål eller tilbakemeldinger.

Her er et verktøy for å hjelpe deg å angripe et eksisterende prosjekt når du er ny i prosjektet.

* Steg 1:
Sjekk ut repoet.
* Steg 2: Kjør scriptet `source setup.sh` for å installere Kantega Code Analyzer. Da kan du kjøre kommandoen `kca_init` fra et hvilket som helst repo du vil analysere.
* Steg 3: Kjør `kca_hotspots` for å finne ut hvilke filer som endres ofte.

### Installasjon

Krever at man er på linux/mac eller kjører i Windows Subsystem for Linux (WSL) eller Git Bash på Windows.
```bash
source setup.sh
```

Du må ha python og pandas installert.

```bash
python3 -m venv venv
source venv/bin/activate
pip install pandas
pip install matplotlib
```

#### Docker

Hvis du ikke har lyst til å installere noe lokalt kan du kjøre kca i Docker.

```bash
docker build -t kca .
docker run -it kca
```




### Tilgjengelige kommandoer
* `kca_init` kjøres som første kommando i et nytt prosjekt. Den vil lage en gitlog-fil som brukes til videre analyse av prosjektet.

* `kca_hotspots` gir deg en liste over aktuelle **hotspots** i koden din. Hotspots er filer som er mye endret over tid.

* `kca_complexity` gir deg en oversikt over hvilke filer som har stor grad av kompleksitet, sammen med en oversikt over hvilke filer som endres mye.

