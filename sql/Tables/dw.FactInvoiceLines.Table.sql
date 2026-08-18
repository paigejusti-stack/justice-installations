/****** Object:  Table [dw].[FactInvoiceLines]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FactInvoiceLines](
	[InvoiceNumber] [nvarchar](max) NULL,
	[JobNumber] [nvarchar](max) NULL,
	[CustomerKey] [bigint] NULL,
	[ServiceKey] [bigint] NULL,
	[IssueDateKey] [bigint] NULL,
	[IssueDate] [datetime2](0) NULL,
	[DueDate] [datetime2](0) NULL,
	[Quantity] [bigint] NULL,
	[UnitPrice] [float] NULL,
	[Discount] [float] NULL,
	[LineTotal] [float] NULL,
	[InvoiceStatus] [nvarchar](max) NULL,
	[IsPaid] [bigint] NULL,
	[CityKey] [bigint] NULL,
	[TechnicianKey] [bigint] NULL,
	[StartDateKey] [bigint] NULL,
	[JobStatus] [nvarchar](max) NULL,
	[IsCompleted] [bigint] NULL,
	[IsCancelled] [bigint] NULL,
	[StartDate] [datetime2](0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
