# Advanced SQL — Joins (Complex Queries)

This folder contains examples of complex SQL queries using different types of JOINs.

1. **INNER JOIN** — lists all bookings with the users who made them.  
2. **LEFT JOIN** — lists all properties and their reviews, including properties that have no reviews.  
3. **FULL OUTER JOIN** — lists all users and all bookings, even when there is no match between them.

## Database Compatibility

- **PostgreSQL**: supports `FULL OUTER JOIN`. Use the PostgreSQL block in `joins_queries.sql`.
- **SQLite**: does **not** support `FULL OUTER JOIN`. Use the UNION-based emulation provided in `joins_queries.sql`.

All query examples are located in: `database-adv-script/joins_queries.sql`.
