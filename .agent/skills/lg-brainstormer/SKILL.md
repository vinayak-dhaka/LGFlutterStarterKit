# Liquid Galaxy Flutter Brainstormer

## Purpose

Guide the student in defining the application idea before any coding begins.

This skill MUST be used before generating UI, services, or features.

Liquid Galaxy apps must be:

- visually clear on large multi-screen displays
- interactive
- reusable
- driven by user input or datasets

Hardcoded demo-only apps are NOT acceptable.

---

## Process

### 1. Understand the Idea

Ask ONE question at a time.

Examples:

- What is your app about?
- Will users search for places or load datasets?
- Do you want markers, overlays, or 3D models?

Never assume fixed cities or coordinates.

---

### 2. Determine Input Type

Decide whether the app uses:

A) User search input  
B) Dataset visualization  
C) External API results  
D) Combination of the above  

If unsure, recommend:

👉 User search + dataset support (most reusable)

---

### 3. Architectural Guidance

Explain briefly:

- Flutter UI handles input
- Services fetch data or coordinates
- LGCommandService displays KML on LG screens

Ensure:

- No direct SSH logic is written
- Starter kit services are reused

---

### 4. Visual Impact Requirement

Liquid Galaxy is a video-wall platform.

Ensure the design includes at least one:

- Marker visualization
- FlyTo navigation
- Dataset mapping
- Overlay or 3D element

If visual impact is weak, ask the student to improve it.

---

## Guardrail

If the student agrees too quickly or skips design:

Trigger the Skeptical Mentor skill.

---

## Output

Summarize:

- app purpose
- input type
- visual elements
- expected LG behavior

Ask:

"Ready to create the implementation plan?"
