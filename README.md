# Event Management Challenge

Dies ist die Lösung zur 24h Developer-Challenge von Streamcheck24.
Ziel ist die Entwicklung eines Event-Management-Systems mit Flutter (Mobile-App) und Spring Boot (Backend),
inklusive REST API, persistenter Datenhaltung und ansprechender Oberfläche (keine Garantie).

---

## Tehcnologie-Stack

**Backend:**
- Java 17
- Spring Boot
- Spring Web, Spring Data JPA
- H2 In-Memory Datenbank

**Frontend:**
- Flutter
- Material Design
- HTTP Package für API-Calls

**Tooling und Entwicklung:**
- GitHub mit 'main', 'develop' und Feature-Branches (Commit/Push/Pull via SourceTree)
- Visual Studio Codee
- GitHub Issues zur Ticket-Verwaltung
- Getrennte Branches für README, AI_USAGE, und ANSWERS zur Dokumentationspflege

---

## Projektstruktur

```plaintext
STREAMCHECK24CHALLENGE/
├── backend/           // Spring Boot Backend
├── mobile-app/        // Flutter Mobile App
├── docs/              // Screenshots, Diagramme, Notizen
├── README.md          // Dieses Dokument
├── AI_USAGE.md        // Dokumentation zur KI-Nutzung
└── ANSWERS.md         // Antworten auf theoretische Fragen
```

---

## Architekturentscheidungen

### Backend

**Spring Boot mit H2 In-Memory Datenbank**
Für diese Challenge habe ich mich bewusst für H2 entschieden, um schnelle Iteration, 
minimale Einrichtung und einfache Testbarkeit zu gewährleisten.
Die Datenbank läuft im Speicher und ist über `/h2-console` erreichbar.
Persistenz über Neustarts hinweg ist für diesen Projektzeitraum nicht erforderlich.

**JPA & Entity-Modellierung**
Die Datenstruktur wird mit klaren JPA-Entitäten umgesetzt:
- `Users`: Benutzer mit Rolle (ORGANIZER, PARTICIPANT)
- `Event`: Veranstaltung mit Teilnehmerbegrenzung
- `EventRegistration`: Verknüpfung zwischen Benutzern und Events
Beziehungen (z.B. Many-To-One) sind über Annotationen modelliert.

**Saubere Schichtenarchitektur (MVC + Service Layer)**
- `Controller`: REST-Endpunkte
- `Service`: Geschäftslogik (z.B. Registrierung, Event-Validierung)
- `Repository`: Datenzugriff per JpaRepository

**REST-konformes API-Design**
Die Routenstruktur folgt Best Practices:
- RessourcenNamen im Plural (`/api/events`)
- HTTP-Methoden semantisch korrekt(`GET`, `POST`, `DELETE`)
- Sauberes Fehler-Handling via `@ControllerAdvice`

### Frontend

**FLutter mit Provider oder einfachem State Management**
Das UI wird durch kleine, wiederverwendbare Widgets strukturiert. 
Zustandsverwaltung erfolgt komponentennah (z.B. `setState`) oder bei wachsender Komplexität über `Provider`.

**Responsives Layout & Material Design**
Die App verwendet Flutters Standardkomponenten zur Gewährleistung einer konsistenten UX auf verschiedenen Geräten.

**Trennung von Logik und UI**
API-Kommunikation, Fehlerbehandlung und Zustandsmanagement werden klar vom UI getrennt gehalten.

**Navigation per benanntem Routing**
Für bessere Lesbarkeit und Wartbarkeit wird ein zentraler `RouteManager` eingesetzt.