/****** Object:  Table [dw].[DimCity]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimCity](
	[CityKey] [bigint] NULL,
	[CityName] [nvarchar](max) NULL,
	[StateCode] [nvarchar](max) NULL,
	[County] [nvarchar](max) NULL,
	[SampleZip] [nvarchar](max) NULL,
	[PopulationBand] [nvarchar](max) NULL,
	[IsCoreMarket] [bit] NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
