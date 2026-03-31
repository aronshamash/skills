---
name: grill-me
description: Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me".
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

1. **Ask the user what plan or design to grill them on** (if not already provided in context)

2. **Map the decision tree** — internally identify the major branches:
   - Core architecture decisions
   - Data model choices
   - Integration points
   - Failure modes and error handling
   - Scalability and performance assumptions
   - Observability and operability
   - Security and access control
   - Deployment and rollout strategy

3. **Walk the tree depth-first** — start with the most foundational decision (the one most others depend on)

4. **For each question**:
   - State which branch of the decision tree you're on
   - Ask the single most important unresolved question on that branch
   - Provide your recommended answer with brief reasoning
   - Wait for the user's response before proceeding

5. **When a branch is resolved**: explicitly acknowledge it, then move to the next

6. **Terminate** when all major branches are resolved and no open questions remain — summarize the agreed design as a concise decision log

## Tone

- Direct and challenging, not adversarial
- No cheerleading or validation of weak answers
- Treat the user as a senior engineer who can handle hard questions
