# Dokumentation zur KI-Nutzung

Dieses Projekt wurde im Rahmen einer 24h-Challenge umgesetzt.
KI-Tools kamen punktuell zur Anwendung, um Planung, Code-Generierung, Strukturierung und Dokumentation zu beschleunigen.
Alle Inhalte wurden verstanden, geprüft und bei Bedarf angepasst.

---

## Übersicht: KI-Einsatzbereiche

| Bereich             | Tool            | Zweck                                                       |
|---------------------|-----------------|-------------------------------------------------------------|
| Projektplanung*     | ChatGPT         | Aufteilung in Tickets, Branch-Strategie, Architekturideen   |
| Code-Generierung*   | ChatGPT         | REST-Controller, DTOs, Flutter-Widgets (Basisstruktur)      |
| Dokumentation*      | ChatGPT         | README.md, AI_USAGE.md, ANSWERS.md (inkl. Erklärungen)      |
| Fehleranalyse       | ChatGPT/Deepseek| Debugging-Hinweise bei Spring Boot Konfigurationen etc.     |
*nach Bedarf angepasst

---

## KI-Einsatz im Detail

### Eintrag 1: Projektplanung

- **Datei/Ort:** `GitHub Issues / Branch-Strategie / Ticketstruktur`
- **Beschreibung:** Gliederung der Challenge in Phasen und GitHub-Tickets
- **Prompt:**
    > „Plane für eine 24h-Developer-Challenge ein vollständiges Event-Management-System mit Flutter und Spring Boot. Erstelle strukturierte Tickets anhand der Anforderungen, die ich dir mitgebe.“
- **Tool:** ChatGPT (GPT-4)
- **Eigene Anpassungen:**
    - Ticket-Beschreibungen selbst festgelegt.
    - Ticket-Reihenfolge final selbst festgelegt.
    - Branches manuell im Repository erstellt
- **Verständnisnachweis:**
Die erstellte Struktur wurde vollständig nachvollzogen. Ziel war die klare Aufteilung des Projektes in verschiedene Fortschrittsphasen und jeweilig unterschiedliche Tickets nach vorlage der vorgegebenen Aufgaben, welche zur Erstellung von Feature-Branches dienen sollen. Allem voran ging es mir um die Übersichtlichkeit und Nachvollziehbarkeit der Fortschritte während des Entwicklungsprozesses.

---

### Eintrag 2: Unterstützung bei der REST-API-Umsetzung

Die KI wurde für folgende Aufgaben genutzt:

- **Ursprüngliches Problem (VS Code Bug):**
  Obwohl die Spring-Komponenten im richtigen Verzeichnis lagen, wurden sie vom Component Scan nicht erkannt.
- **Lösung (KI-Vorschlag nachdem alle anderen Fehler/Probleme ausgeschlossen werden konnten):**
  Neu-Anlegen bzw. Kopieren der Dateien über den Windows Explorer – erst danach wurden sie korrekt registriert.
- **Folge:** Das Problem kostete mehrere Stunden und war der größte Zeitfresser der gesamten Challenge.

---

### Eintrag 3: Fehleranalyse & Debugging

- **Spring Boot `404` trotz korrekter Endpunkte:**
  Ursache war die interne Erkennung der Projektstruktur durch die IDE.
- **Fehlende DTO-Getter:**
  Die KI erkannte auf Basis der Fehlermeldung die Ursache und generierte gültige DTOs mit Konstruktoren und Gettern.
- **Routingprüfung per Dummy-Endpoint (`/api/hello`):**
  Half bei der iterativen Prüfung, ob der Server korrekt läuft.

---

### Eintrag 4: Flutter-Frontend & API-Integration

Insbesondere in der zweiten Hälfte des Projekts – unter wachsendem Zeitdruck – habe ich KI verstärkt eingesetzt, um:

- **Flutter-Screens strukturiert aufzubauen** (z. B. Login/Register mit TabBar, Event-Listen, Detailseiten)
- **Formularvalidierung effizient umzusetzen**
- **API-Service-Klassen schnell und korrekt zu erstellen** (GET, POST, DELETE)
- **Fehlermeldungen und Ladeanzeigen einzubinden** (`LoadingIndicator`, `ErrorDisplay`)

Trotz der KI-Unterstützung habe ich sämtliche generierten Vorschläge geprüft, angepasst und kontextgerecht eingebunden. Entscheidungen zur UI-Logik, Navigation und Fehlerbehandlung wurden bewusst und nachvollziehbar getroffen.

---

### Eintrag 5: Dokumentation

Die gesamte Projektdokumentation (README.md, AI_USAGE.md, ANSWERS.md) wurde durch KI unterstützt, jedoch in enger Abstimmung mit den realen Projektfortschritten. Besonders beim Formulieren der Herausforderungen und Umgehungslösungen wurde die KI genutzt, um präzise und nachvollziehbar zu dokumentieren, was im Zeitrahmen möglich war – und was nicht.

---

## Transparenz-Hinweis

Die KI wurde genutzt, um produktiver zu arbeiten – nicht um Verständnis zu ersetzen.  
Insbesondere in der finalen Phase des Projekts – nach einem schwerwiegenden Bug und unter großem Zeitdruck – war sie ein unverzichtbares Werkzeug zur strukturierten und pragmatischen Umsetzung.  
Jede Komponente wurde einzeln nachvollzogen, kommentiert und (wo nötig) angepasst.  
Die Eigenleistung liegt nicht nur im Quellcode, sondern auch im konzeptionellen Durchhaltevermögen, in pragmatischer Planung, der Priorisierung und im Umgang mit auftretenden Hindernissen.

