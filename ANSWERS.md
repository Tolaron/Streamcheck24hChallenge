# Theoretische Fragen - Developer Challenge

---

## Database & Backend

### 1. Was ist der Unterschied zwischen `@OneToMany` und `@ManyToOne`?

- `@OneToMany` beschreibt eine Beziehung, bei der **eine Entität** mit **vielen anderen Entitäten** verknüpft ist.
  Beispiel(Anhand des Projekts): Ein `User` kann viele `EventRegistrations`(also Anmeldungen an Events) haben.

  - `@ManyToOne` beschreibt die Gegenrichtung: **Viele Entitäten** gehören zu *einer Entität**.
  Beispiel(Anhand des Projekts): Viele `EventRegistrations`(also Anmeldungen an ein Event) gehören zu einem `Event`.

### 2. Was ist der Unterschied zwischen `@RestController` und `@Controller`?

- `@Controller` wird verwendet, wenn man serverseitige HTML-Steien zurückgeben möchte.
- `@RestController` ist eine Spezialisierung von `@Controller`, die automatisch alle Rückgaben als JSON serialisiert - ideal für REST APIs.
(Bei RESTful Anwendungen wie dieser Challenge ist `@RestController` der richtige Ansatz.)

---

## Frontend & Mobile

### 1. Erkläre den Flutter Widget Lifecycle

- **StatelessWidget:** Wird einmal aufgebaut (`build()`), danach nicht mehr verändert.
- **StatefulWidget:**
    - `createState()` - Initialisiert das State-Objekt
    - `initState()` - Einmaliger Setup-Callback beim ersten Laden
    - `build()` - Baut das UI bei jeder Zustandsänderung neu
    - `dispose()` - Aufräumarbeiten vor der Zerstörung des Widgets

---

### 2. Was sind die Vorteile von `StatelessWidget` vs. `StatefulWidget`?

- **StatelessWidget**
    - Vorteil: Einfach, schneller, keine Zustandsverwaltung notwendig
    - Einsatz: UI-Komponenten, die sich nie verändern

- **StatefulWidget**
    - Vorteil: Kann interne Zustände verwalten (z.B. Ladeindikatoren, Formularzustände)
    - Einsatz: Interaktive Screens, Formulare, Ladeanimationen

> Wenn kein Zustand gebraucht wird: Immer `StatelessWidget` -> bessere Performance + einfachere Tests

---

### 3. Welche State Management Libraries verwendest du/würdest du verwenden und warum?

- **setState** - Für kleine, lokale Zustände (z.B. Button gedrückt, Form valid)
- **Provider** - Für globale Zustände und einfache Architektur
- **Riverpod** - ???

> hier: **Provider**, weil es schnell einsetzbar, leichtgewichtig und weit verbreitet ist

## Allgemein

### 1. Wie würdest du die Performance deiner App messen?

---

### 2. Wie würdest du das Testing der App verbessern, wenn du mehr Zeit investieren würdest?

---