# Example: Data Model Decision

## Context
User wants to add membership tier discounts to Product model.

## Session Flow

**Branch: Data Model**

Q: Should discounts be embedded in Product, or a separate MembershipDiscount collection with references?

Recommendation: Separate collection - discount rules evolve independently from products, easier to audit/version.

User: Separate makes sense.

---

**Branch: Query Performance**

Q: How are these queried? Per-product lookup, or bulk fetch for search results?

Recommendation: Bulk fetch - search results need all discounts. Use $lookup aggregation or in-memory join.

User: Search results page - bulk fetch.

---

**Branch: Cache Strategy**

Q: Discounts change how often? Should they be cached in Algolia with products, or fetched on-demand?

Recommendation: If hourly+ changes, cache in Algolia. If real-time pricing, fetch on-demand with Redis cache.

User: Changes weekly at most - cache in Algolia.

---

**Branch: Backwards Compatibility**

Q: Existing products without discounts - return null, empty array, or default object?

Recommendation: Empty array - easier for clients to map over without null checks.

User: Empty array.

---

## Decision Log

- New collection: `MembershipDiscounts` with `{ productId, membershipTierId, discountPercent }`
- Denormalized into Algolia product records for search
- Bulk fetch via aggregation for product lists
- Products without discounts return `discounts: []`
- Weekly update cadence via admin UI
