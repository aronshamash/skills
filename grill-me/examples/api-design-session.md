# Example: API Design Session

## Context
User wants to add a new GraphQL mutation for bulk outlet updates.

## Session Flow

**Branch: Core Architecture**

Q: Should this be a single mutation handling N outlets, or a batch operation endpoint?

Recommendation: Single mutation with array input - fits GraphQL patterns, client can retry individual failures.

User: Agreed, single mutation.

---

**Branch: Data Model**

Q: What's the atomicity guarantee - all-or-nothing, or partial success with detailed results?

Recommendation: Partial success with per-outlet result array - bulk ops shouldn't fail entirely on one bad record.

User: Partial success, return success/failure per outlet.

---

**Branch: Failure Modes**

Q: If 50 outlets succeed and 1 fails validation, what's the rollback strategy?

Recommendation: No rollback - partial success is the contract. Client handles retries for failed items.

User: Correct, no rollback.

---

**Branch: Performance**

Q: What's the expected batch size? Does this need rate limiting or background processing?

Recommendation: If >100 outlets typical, use async job pattern. Otherwise, inline is fine with 5s timeout.

User: Max 50 outlets per request, inline is fine.

---

## Decision Log

- Single GraphQL mutation: `bulkUpdateOutlets(inputs: [OutletUpdateInput!]!): [OutletUpdateResult!]!`
- Partial success semantics - no rollback on individual failures
- Inline processing - 50 outlet limit enforced
- Per-outlet result: `{ outletId, success, error }`
- Client responsible for retry logic
