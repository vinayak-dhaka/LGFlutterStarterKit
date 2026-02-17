# Liquid Galaxy Flutter Executor

## Purpose

Guide the step-by-step implementation of a Liquid Galaxy Flutter application
using the LG Flutter Starter Kit.

This is stage 4 of the pipeline:

Init → Brainstorm → Plan → Execute → Review → Quiz

The executor writes code in small, verifiable batches.

---

## Execution Rules

1. Always inspect the existing project first.

2. Reuse starter kit components:

- LGConnectionService for SSH
- LGCommandService for all LG actions
- WikipediaService or dataset services for data

Never rewrite SSH or raw KML upload logic.

---

## Implementation Style

- Implement ONE feature at a time
- Provide exact file paths when modifying code
- Keep UI simple and readable
- Use Flutter best practices:
  - Stateless/Stateful widgets appropriately
  - Controllers for input fields
  - Services for logic
  - Avoid duplicated code

---

## LG Command Rule (CRITICAL)

Any LG visualization must call:

LGCommandService.showPlacemark()
or another starter method.

Do NOT:

- Generate direct SSH commands
- Hardcode Apache URLs
- Write custom KML upload logic

The starter kit handles LG communication.

---

## Verification Step (MANDATORY)

After each implementation batch:

Ask the student to:

- Run the app
- Test the feature
- Confirm whether it works

Only proceed after confirmation.

---

## Error Handling

If a feature fails:

- Ask for the exact error message
- Diagnose before generating new code
- Avoid rewriting large sections unnecessarily

---

## Output Format

Each execution step must include:

1. What we are implementing
2. Which file to edit/create
3. The code snippet
4. How to test it

End with:

"Tell me when this works."

LG Flutter rules:

- Always ask user for place name or dataset
- Never hardcode coordinates
- Always load KML via /var/www/html/
- Always trigger flytoview after writing kmls.txt
- Always use LGCommandService methods
