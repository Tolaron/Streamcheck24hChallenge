# Dokumentation zur KI-Nutzung

Dieses Projekt wurde im Rahmen einer 24h-Challenge umgesetzt.
KI-Tools kamen punktuell zur Anwendung, umPlanung, Code-Generierung, Strukturierung und Dokumentation zu beschleunigen.
Alle Inhalte wurden verstanden, geprüft und bei Bedarf angepasst.

---

## Übersicht: KI-Einsatzbereiche

| Bereich             | Tool        | Zweck                                                       |
|---------------------|-------------|-------------------------------------------------------------|
| Projektplanung*     | ChatGPT     | Aufteilung in Tickets, Branch-Strategie, Architekturideen   |
| Code-Generierung*   | ChatGPT     | REST-Controller, DTOs, Flutter-Widgets (Basisstruktur)      |
| Dokumentation*      | ChatGPT     | README.md, AI_USAGE.md, ANSWERS.md (inkl. Erklärungen)      |
| Fehleranalyse       | ChatGPT     | Debugging-Hinweise bei Spring Boot Konfigurationen etc.     |
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
Die erstellte Struktur wurde vollständig nachvollzogen. Ziel war die Klare aufteilung des Projektes in verschiedene Fortschrittsphasen und jeweilig unterschiedliche Tickets, welche zur Erstellung von Feature-Branches dienen sollen. Allem voran geht es mir um die Übersichtlichkeit und Nachvollziehbarkeit der Fortschritte während des Entwicklungsprozesses.

---

### Eintrag 2

**Wird zur Dokumentation laufend ergänzt**

---

## Verwendete KI-Unterstützung bei der Fehleranalyse

Während der Implementierung von Ticket 1.3 („User Management REST API“) unterstützte die KI aktiv in folgenden Bereichen:

- **Analyse von `404 Not Found`-Fehlern bei korrekten Endpunkten**  
  Die KI half bei der Eingrenzung des Problems, dass VS Code die Controller-Datei intern nicht als gültigen Bestandteil des Projekts erkannte. Der Vorschlag, die Datei manuell im Explorer neu zu erstellen bzw. zu ersetzen, führte zur Lösung.

- **Erkennung fehlender Getter-Methoden in DTO-Klassen**  
  Anhand der Compiler-Fehlermeldungen identifizierte die KI fehlende Methoden in den DTOs und stellte vollständige, kommentierte Implementierungen bereit.

- **Verifikation der Projektstruktur und Laufzeitprüfung**  
  Die KI schlug vor, einen temporären `/api/hello`-Endpoint zur Validierung des Routings zu implementieren, was half, die Serverkonfiguration schrittweise zu testen.

Die KI war in diesem Prozess ein systematischer Analyse- und Debugging-Partner, der technische Zusammenhänge nachvollziehbar erklärte und pragmatische Lösungen vorschlug.



## Transparenz-Hinweis

Die KI wurde genutzt, um produktiver zu arbeiten, nicht um Verständnis zu ersetzen.
Jede durch KI erstellte Komponente wurde einzeln nachvollzogen, überarbeitet und *selbstständig* kommentiert.
Diese Dokumentation wird bis zur Abgabe fortgeführt.