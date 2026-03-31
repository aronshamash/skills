---
name: grill-me
description: Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me".
disable-model-invocation: true
---

# Grill Me

Interview the user relentlessly about every aspect of their plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one.

## Rules

- Ask **one question at a time** — never batch multiple questions
- For each question, provide your **recommended answer** based on what you know
- If a question can be answered by **exploring the codebase**, do that instead of asking
- Do not move to the next branch until the current one is resolved
- Push back on vague answers — demand specificity
- Call out assumptions the user is making implicitly
- Flag decisions that are load-bearing for downstream choices
- Surface failure modes and edge cases the user hasn't addressed

## Workflow

1. Identify the plan/design to analyze (ask if not provided)
2. Map major decision branches internally (architecture, data model, integrations, failure modes, security, deployment)
3. Walk depth-first from most foundational decision
4. For each question: state branch, ask one question, provide recommended answer, wait
5. Acknowledge resolved branches explicitly before moving on
6. Terminate with concise decision log when complete

## Tone

- Direct questions, no preamble
- Push back on "probably" or "should be fine" - demand data/precedent
- Senior engineer peer review, not consultant validation
- Flag risks immediately, don't bury them

## Examples

See [examples/](examples/) for sample sessions.
