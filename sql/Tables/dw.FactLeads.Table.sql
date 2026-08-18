/****** Object:  Table [dw].[FactLeads]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FactLeads](
	[CustomerKey] [bigint] NULL,
	[CityKey] [bigint] NULL,
	[RequestedDateKey] [bigint] NULL,
	[CustomerNameNormalized] [nvarchar](max) NULL,
	[CityName] [nvarchar](max) NULL,
	[RequestedDate] [datetime2](0) NULL,
	[RequestStatus] [nvarchar](max) NULL,
	[FormName] [nvarchar](max) NULL,
	[OnlineBooking] [nvarchar](max) NULL,
	[QuoteNumber] [nvarchar](max) NULL,
	[JobNumber] [nvarchar](max) NULL,
	[TimeWindow] [nvarchar](max) NULL,
	[IsConverted] [bigint] NULL,
	[IsDeclined] [bigint] NULL,
	[IsOpen] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
