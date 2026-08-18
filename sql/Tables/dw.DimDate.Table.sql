/****** Object:  Table [dw].[DimDate]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimDate](
	[DateKey] [bigint] NULL,
	[Date] [datetime2](0) NULL,
	[DayOfWeek] [bigint] NULL,
	[DayName] [nvarchar](max) NULL,
	[DayOfMonth] [bigint] NULL,
	[DayOfYear] [bigint] NULL,
	[WeekOfYear] [bigint] NULL,
	[MonthNum] [bigint] NULL,
	[MonthName] [nvarchar](max) NULL,
	[MonthShort] [nvarchar](max) NULL,
	[MonthYear] [nvarchar](max) NULL,
	[QuarterNum] [bigint] NULL,
	[QuarterName] [nvarchar](max) NULL,
	[YearNum] [bigint] NULL,
	[IsWeekend] [bit] NULL,
	[IsMonthEnd] [bit] NULL,
	[YearMonth] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
