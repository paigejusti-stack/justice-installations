# SQL

DDL for the `dw` warehouse schema, organised by object type.

```
sql/
├── Security/   schema and the read-only report user
├── Tables/     dimension and fact tables
└── Views/      reporting views
```

## Build order

Run inside the target database, in this order:

1. **`Security/dw.Schema.sql`** — creates the `dw` schema.
2. **`Tables/*.sql`** — five dimensions and three facts. Order within this step
   does not matter; the tables carry no foreign-key constraints, so the star
   schema is enforced in the semantic model rather than in the database.
3. **`Views/dw.vw_DimCustomer.View.sql`** — the customer projection the model
   reads, which drops the PII-shaped columns from `dw.DimCustomer`.
4. **`Security/PBIReader.User.sql`** — creates the read-only user and grants
   `SELECT` on `SCHEMA::[dw]`. Replace the placeholder password first.

The tables are created empty. Load them from the bacpac described in
[`../database/README.md`](../database/README.md), or from your own source
extract.

## Schema

| Object | Grain |
|---|---|
| `dw.FactJobs` | one row per job |
| `dw.FactInvoiceLines` | one row per invoice line |
| `dw.FactLeads` | one row per inbound request |
| `dw.DimCustomer` | one row per customer |
| `dw.DimCity` | one row per city served |
| `dw.DimService` | one row per service offered |
| `dw.DimTechnician` | one row per technician |
| `dw.DimDate` | one row per calendar day |

`dw.DimDate` is shared by all three facts. Each fact carries several date keys —
`FactJobs` has requested, start and end; `FactInvoiceLines` has issue and start —
but the semantic model currently joins each fact to `DimDate` on one of them
(`StartDateKey`, `IssueDateKey`, `RequestedDateKey` respectively). The extra keys
are available for role-playing relationships that have not been wired up. See the
model note in the root [README](../README.md#one-thing-the-model-does-not-do-yet).

## A note on types

These scripts are scripted-out from the working database, so most string columns
are `nvarchar(max)` and most integers are `bigint` — wider than the data needs.
That is honest about how the warehouse was actually built rather than tidied up
after the fact. Narrowing them is the obvious first change for a production
version, along with adding the primary and foreign keys.
