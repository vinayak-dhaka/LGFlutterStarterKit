# Liquid Galaxy Flutter Init

## Purpose

Initialize a new Liquid Galaxy Flutter application using the LG Flutter Starter Kit.

This project is NOT a finished app.
It is a reusable framework for building LG applications.

The starter kit already includes:

- LG SSH connection service
- LG command service for KML control
- Wikipedia-based location search
- Dataset-ready architecture
- Configurable LG Master IP setup
- Basic navigation & marker pipeline

## Responsibilities

When initializing a project:

1. Ask the student:
   - What is the project idea?
   - Will it display locations, datasets, or models?
   - What visual impact should it have on the LG screens?

2. Ensure the project:
   - Uses the provided LG services
   - Does NOT hardcode coordinates or IPs
   - Accepts user input for places or datasets
   - Shows results visually on Liquid Galaxy

3. Confirm environment setup:
   - Flutter installed
   - LG Master IP known (`hostname -I`)
   - SSH credentials available

## Guardrails

- NEVER generate custom SSH logic if LGConnectionService exists.
- ALWAYS use LGCommandService for KML display.
- Avoid fixed demo-only apps like "Fly to Delhi".
- Ensure the app is reusable for any place or dataset.

## Educational Goal

Teach students:

- How LG loads KML via Apache
- Why localhost URLs are used
- How Flutter separates UI,
