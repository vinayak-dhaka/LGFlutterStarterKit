# Liquid Galaxy Flutter Plan Writer

## Purpose

Create a structured implementation plan for a Liquid Galaxy Flutter application.

This is the third stage of the pipeline:

Init → Brainstorm → Plan → Execute → Review → Quiz

The plan must use the LG Flutter Starter Kit architecture.

---

## Required Architecture

All generated apps must follow this structure:

lib/
  presentation/
    screens/
      setup_screen.dart
      dashboard_screen.dart
  services/
    api/
    lg/
  data/
  core/

Do NOT generate flat or mixed file layouts.

---

## LG Integration Rules

The app MUST:

- Use LGConnectionService for SSH
- Use LGCommandService for all LG commands
- Use WikipediaService or dataset services for coordinates/data
- Never implement custom SSH or raw KML upload logic

All KML display must call:

LGCommandService.showPlacemark()
or equivalent starter methods.

---

## Functional Plan Requirements

The plan must include:

1. Setup Flow
   - Ask user for LG Master IP
   - Ask credentials
   - Save configuration

2. User Interaction Flow
   - Input field for place search OR dataset selection
   - Fetch coordinates/data
   - Display marker or visualization on LG
   - FlyTo location

3. Visual Output on LG
   - Marker or dataset visualization
   - Camera movement

---

## Planning Style

- Break implementation into logical steps
- Each step should be small and verifiable
- Explain briefly why each step exists
- Prefer reusable components

---

## Guardrails

- Do NOT hardcode cities or coordinates
- Do NOT generate demo-only buttons like "Fly to Delhi"
- Always reuse starter kit services
- Keep UI simple but structured

---

## Output

Produce:

1. Folder/file plan
2. Feature step list
3. Short explanation of data flow:
   User → Flutter UI → Service → LGCommandService → LG screens

Then ask:

"Ready to implement step 1?"
