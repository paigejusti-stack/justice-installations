# Business-Friendly Naming Map

Apply these in **Power BI Desktop → Model view**. Renaming there updates all
DAX references and all report visual bindings automatically. Do **not** rename
by editing TMDL/JSON directly — the report binds by name and will break.

Legend: **Rename** = change the display name. **Hide** = right-click → Hide
from report view (keys, technical flags, sort helpers). **Sort by** = set
Column tools → Sort by column.

---

## Tables

| Current | Rename to |
|---------|-----------|
| DimCustomer | Customer |
| DimService | Service |
| DimTechnician | Technician |
| DimCity | City |
| DimDate | Date |
| FactJobs | Jobs |
| FactInvoiceLines | Invoice Lines |
| FactLeads | Leads |
| _Measures | *(keep — hidden measure holder)* |
| Time Intelligence | *(keep)* |
| _Page Subtitles | *(keep — hidden helper)* |

After renaming DimDate → **Date**, confirm it's still marked as the date table
(Table tools → Mark as date table) — it aligns with the existing Manage Dates
config.

---

## Columns

### Customer (was DimCustomer)
| Current | Action |
|---------|--------|
| CustomerKey | **Hide** (key) |
| CustomerNameNormalized | **Hide** (dedup helper) |
| CustomerName | → Customer Name |
| Email | → Email |
| Phone | → Phone |
| Status | → Customer Status |
| LeadSource | → Lead Source |
| CreatedDate | → Created Date |
| ConsentSms | → SMS Consent |
| ConsentEmail | → Email Consent |
| UtmSource / UtmMedium / UtmCampaign | → UTM Source / UTM Medium / UTM Campaign |
| Tags | → Tags |
| HasPaymentOnFile | → Has Payment on File |
| WasDeduplicated | **Hide** (technical) |

### Service (was DimService)
| Current | Action |
|---------|--------|
| ServiceKey | **Hide** |
| ServiceCode | → Service Code |
| ServiceName | → Service Name |
| Category | → Service Category |
| ListPrice | → List Price |
| EstMinutes | → Est. Minutes |
| IsAddon | → Is Add-on |

### Technician (was DimTechnician)
| Current | Action |
|---------|--------|
| TechnicianKey | **Hide** |
| TechnicianId | → Technician ID |
| TechnicianName | → Technician Name |
| HireDate | → Hire Date |
| Specialty | → Specialty |
| IsActive | → Is Active |

### City (was DimCity)
| Current | Action |
|---------|--------|
| CityKey | **Hide** |
| CityName | → City |
| StateCode | → State |
| County | → County |
| SampleZip | → Sample ZIP |
| PopulationBand | → Population Band |
| IsCoreMarket | → Core Market |
| Latitude | → Latitude |
| Longitude | → Longitude |

### Date (was DimDate)
| Current | Action |
|---------|--------|
| DateKey | **Hide** |
| Date | → Date |
| DayOfWeek | → Day of Week |
| DayName | → Day Name |
| DayOfMonth | → Day of Month |
| DayOfYear | → Day of Year |
| WeekOfYear | → Week of Year |
| MonthNum | **Hide** (sort helper) |
| MonthName | → Month · **Sort by** MonthNum |
| MonthShort | → Month (Short) · **Sort by** MonthNum |
| MonthYear | → Month-Year · **Sort by** YearMonth |
| QuarterNum | **Hide** (sort helper) |
| QuarterName | → Quarter · **Sort by** QuarterNum |
| YearNum | → Year |
| IsWeekend | → Is Weekend |
| IsMonthEnd | → Is Month End |
| YearMonth | **Hide** (sort helper) |

### Jobs (was FactJobs)
| Current | Action |
|---------|--------|
| CustomerKey / CityKey / TechnicianKey | **Hide** (keys) |
| RequestedDateKey / StartDateKey / EndDateKey | **Hide** (keys) |
| JobNumber | → Job Number |
| QuoteNumber | → Quote Number |
| InvoiceNumber | → Invoice Number |
| JobTitle | → Job Title |
| JobType | → Job Type |
| Status | → Job Status |
| IsCompleted / IsCancelled | **Hide** (flags used by measures) |
| PropertyZip | → Property ZIP |
| RequestedDate | → Requested Date |
| StartDate | → Start Date |
| EndDate | → End Date |
| JobTotal | → Job Total |
| BookingFee | → Booking Fee |
| RevenueCompleted | **Hide** (use the Revenue measures) |
| DurationMin | → Duration (min) |
| CustomerRating | → Customer Rating |
| Notes | → Notes |
| RequestToStartDays | → Request-to-Start Days |

### Invoice Lines (was FactInvoiceLines)
| Current | Action |
|---------|--------|
| CustomerKey / ServiceKey / CityKey / TechnicianKey | **Hide** (keys) |
| IssueDateKey / StartDateKey | **Hide** (keys) |
| InvoiceNumber | → Invoice Number |
| JobNumber | → Job Number |
| IssueDate | → Issue Date |
| DueDate | → Due Date |
| Quantity | → Quantity |
| UnitPrice | → Unit Price |
| Discount | → Discount |
| LineTotal | → Line Total |
| InvoiceStatus | → Invoice Status |
| IsPaid | **Hide** (flag used by measures) |
| JobStatus | → Job Status |
| IsCompleted / IsCancelled | **Hide** (flags) |
| StartDate | → Start Date |

### Leads (was FactLeads)
| Current | Action |
|---------|--------|
| CustomerKey / CityKey / RequestedDateKey | **Hide** (keys) |
| CustomerNameNormalized | **Hide** (dedup helper) |
| CityName | → City |
| RequestedDate | → Requested Date |
| RequestStatus | → Request Status |
| FormName | → Form Name |
| OnlineBooking | → Online Booking |
| QuoteNumber | → Quote Number |
| JobNumber | → Job Number |
| TimeWindow | → Time Window |
| IsConverted / IsDeclined / IsOpen | **Hide** (flags used by measures) |

---

## Measures

Most are already business-friendly — **do not rename them.** Two cleanups:

### Fix ambiguity: two different "revenue" bases
| Current | Rename to | Why |
|---------|-----------|-----|
| Revenue | Booked Revenue (Jobs) | `SUM(Jobs[Job Total])` — different base than Total Revenue |
| Avg Ticket | Avg Ticket (Booked) | Uses Booked Revenue ÷ Total Jobs; distinct from Avg Job Ticket |

`Total Revenue` and `Avg Job Ticket` are invoice-line based — leave as-is. The
rename just stops the two revenue definitions from looking interchangeable.

### Hide (used only as visual inputs, never as standalone fields)
- All `… Color` measures (conditional-formatting inputs):
  `Total Revenue YoY % Color`, `Completed Jobs YoY % Color`,
  `Avg Job Ticket YoY % Color`, `Active Customers YoY % Color`,
  `Avg Customer Rating YoY Color`, `Outstanding AR YoY % Color`,
  `Cities Served YoY % Color`, `Top City Share % YoY Color`,
  `Revenue per City YoY % Color`.

Keep the `… Display`, `Units Sold`, `Total Jobs Display`, and
`Top Service With Rev` measures visible — they return formatted text and are
placed directly on cards.

---

## Status: applied

These renames have been applied to the model and report. The `dw` SQL keeps its
original names (the warehouse layer); the source-to-model mapping is captured in
[Data_Dictionary.xlsx](data-dictionary/Data_Dictionary.xlsx) (Data Dictionary
tab: `Source Column` → `PBI Field (Friendly)`).
