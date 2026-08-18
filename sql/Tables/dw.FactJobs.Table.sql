/****** Object:  Table [dw].[FactJobs]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FactJobs](
	[JobNumber] [nvarchar](max) NULL,
	[QuoteNumber] [nvarchar](max) NULL,
	[InvoiceNumber] [nvarchar](max) NULL,
	[CustomerKey] [bigint] NULL,
	[CityKey] [bigint] NULL,
	[TechnicianKey] [bigint] NULL,
	[RequestedDateKey] [bigint] NULL,
	[StartDateKey] [bigint] NULL,
	[EndDateKey] [bigint] NULL,
	[JobTitle] [nvarchar](max) NULL,
	[JobType] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[IsCompleted] [bigint] NULL,
	[IsCancelled] [bigint] NULL,
	[PropertyZip] [nvarchar](max) NULL,
	[RequestedDate] [datetime2](0) NULL,
	[StartDate] [datetime2](0) NULL,
	[EndDate] [datetime2](0) NULL,
	[JobTotal] [float] NULL,
	[BookingFee] [float] NULL,
	[RevenueCompleted] [float] NULL,
	[DurationMin] [bigint] NULL,
	[CustomerRating] [bigint] NULL,
	[Notes] [nvarchar](max) NULL,
	[RequestToStartDays] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
