# Database

The database backup (`justiceinstallations.bacpac`) is **not committed** to git.
It is a large binary that git handles badly, and the repository ships the DDL
instead, so the warehouse can be rebuilt without it.

The data in it is synthetic — see [`../LICENSE`](../LICENSE). `dw.DimCustomer`
carries PII-shaped columns (name, email, phone, consent flags) because a real
jobs-and-invoices warehouse would, but the values are fabricated and the
semantic model does not surface them.

## Restore the bacpac (optional)

**SSMS / SQL Server**
1. Right-click **Databases → Import Data-tier Application…**
2. Select `justiceinstallations.bacpac` and follow the wizard.

**SqlPackage (CLI)**
```bash
SqlPackage /Action:Import \
  /SourceFile:"justiceinstallations.bacpac" \
  /TargetServerName:"<server>" \
  /TargetDatabaseName:"justiceinstallations"
```

## Or build the schema from DDL

Run the scripts in [`../sql/`](../sql/) — build order and object listing are in
[`../sql/README.md`](../sql/README.md). That gives you the empty warehouse; you
supply the rows.
