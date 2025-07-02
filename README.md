# Event Management Challenge

Dies ist die Lösung zur 24h Developer-Challenge von Streamcheck24.  
Ziel war die Entwicklung eines vollständigen Event-Management-Systems bestehend aus einem Spring Boot Backend und einer Flutter Mobile-App – inklusive REST API, persistenter Datenhaltung und sauberer Benutzeroberfläche.

---

## Technologie-Stack

**Backend:**
- Java 17
- Spring Boot
- Spring Web, Spring Data JPA
- H2 In-Memory Datenbank
- Maven

**Frontend (Mobile App):**
- Flutter
- Material Design 3
- HTTP-Package (`http`)
- Form Validation (Flutter Widgets)
- Pull-to-Refresh
- Navigation per benannten Routen
- Manuelles State-Management (setState)

**Tooling und Entwicklung:**
- GitHub mit Branch-Struktur (`main`, `develop`, `feature/...`)
- Visual Studio Code (Backend), Android Studio (Flutter)
- SourceTree für Git GUI
- GitHub Issues zur Ticketverwaltung
- Getrennte Branches für Dokumentation (`README`, `AI_USAGE`, `ANSWERS`)

---

## Projektstruktur

```plaintext
STREAMCHECK24CHALLENGE/
├── backend/             // Spring Boot Backend
├── mobile_app/          // Flutter App (UI + HTTP-Client)
├── docs/                // Screenshots, Diagramme, Notizen
├── README.md            // Dieses Dokument
├── AI_USAGE.md          // Dokumentation zur KI-Nutzung
└── ANSWERS.md           // Antworten auf Theoriefragen
```

---

## Umsetzung nach Tickets

### Phase 1 – Backend

| Ticket   | Thema                          | Status     |
|----------|--------------------------------|------------|
| 1.1      | Spring Boot Setup              | ✅        |
| 1.2      | JPA Entities (User, Event…)    | ✅        |
| 1.3      | User Management API            | ✅        |
| 1.4      | Event API (CRUD)               | ✅        |
| 1.5      | Registrierung zu Events        | ✅        |
| 1.6      | Validierung + ExceptionHandling| ✅        |
| 1.7      | Unit-Test (UserService)        | ✅        |

### Phase 2 – Mobile-App UI

| Ticket   | Thema                              | Status |
|----------|------------------------------------|--------|
| 2.1      | Flutter Projekt Setup              | ✅     |
| 2.2      | Login/Register UI + TabBar         | ✅     |
| 2.3      | Event-Liste + Pull-to-Refresh      | ✅     |
| 2.4      | Event Detail View                  | ✅     |
| 2.5      | Create Event Formular              | ✅     |
| 2.6      | Profile Screen mit TabBar          | ✅     |
| 2.7      | Generisches ErrorWidget            | ✅     |

### Phase 3 – API-Integration

| Ticket   | Thema                                | Status |
|----------|--------------------------------------|--------|
| 3.1      | Anbindung Login/Register API         | ✅     |
| 3.1      | Anbindung Event-Endpunkte (GET, POST, DELETE) | ❌ (rückgängig gemacht wegen Zeitmangel (wäre sonst Buggy gewesen)) |

---

## Architekturentscheidungen

### Backend

**Warum Spring Boot mit H2?**  
- Schnell aufsetzbar, kein Setup für Datenbankserver
- Ideal für Entwicklung und Tests
- Ermöglicht einfache API-Tests über Swagger oder Postman

**Datenmodellierung mit JPA**  
- Alle Entitäten enthalten sinnvolle Annotationen (`@ManyToOne`, `@OneToMany`)
- Validierung per `@NotNull`, `@Size` usw.

**Fehlerbehandlung**  
- Globales Exception-Handling via `@ControllerAdvice`
- Eigene Fehlerklassen für `NotFound`, `ValidationError`

**GET/POST/DELETE klar getrennt**
- Alle Endpunkte REST-konform

### Frontend

**UI-Strategie**
- Klar getrennte Widgets für jede View (Login, Eventliste, Detail, Create, Profile)
- Form-Validierung mit Flutter-internen Validatoren
- TabBar zur Umschaltung zwischen Login/Register und Tabs im ProfileScreen

**State-Management**  
- Manuell per `setState()` für diese Challenge ausreichend  
- Für produktiven Einsatz wäre Provider, Riverpod oder Bloc geeigneter

**Fehlermanagement**
- Einheitliches `ErrorDisplay` Widget für REST-Fehler oder UI-Probleme

---

## Bekannte Probleme & ihre Lösungen

### Problem: Flutter startet nicht (Desktop-Projekt fehlt)
**Ursache:** Desktop-Unterstützung nicht aktiviert  
**Lösung:** Projekt auf Android eingestellt, Fokus auf Mobile-App behalten.

### Problem: EntityManager-Fehler bei H2-Shutdown
**Lösung:** War harmlos – H2-Logging nach dem Testlauf. Ignoriert.

### Problem: HTTP-Statuscode nicht 200/201
**Lösung:** Fehlertexte im `EventService` ergänzt, z. B. bei `createEvent` und `deleteEvent`.

### Problem: Events konnten nicht geladen werden (Flutter)
**Ursache:** Fehler bei JSON-Struktur  
**Lösung:** `Event.fromJson()` angepasst (Datum parsen, ID zu String casten)

### Problem: Es konnte keine Verbindung zu den JPA repositorys aufgebaut werden (Spring Data Repository)
**Ursache:** Visual Studio Code hat sie (aus einem mir immernoch unerfindlichen Grund) nicht "erkannt/registriert"
**Lösung:** Eher ein Workaround nach mehreren Stunden rumprobieren: Die dateien im Windows-Explorer erstellt bzw. wahlweise in den richtigen Ordner reinkopiert/reingezogen. Erst dann hat Visual Studio Code die dateien "erkannt". Das Problem hat mit abstand die meiste Zeit und Nerven gekostet.

---

## Fazit

Innerhalb der 24h-Challenge wurden sowohl ein vollständiges Backend mit funktionierender API als auch eine mobile App mit den meisten UI-Screens und Form-Validierungen umgesetzt.  
REST-Integration für Event-Endpoints im Flutter-Frontend wurde begonnen, aber für die Dokumentation temporär zurückgebaut.  

Die App ist modular aufgebaut, testfähig und ließe sich leicht erweitern  
Trotz Zeitdruck wurde auf klare Code-Struktur, Fehlerbehandlung und Wiederverwendbarkeit geachtet.
