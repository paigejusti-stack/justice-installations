/****** Object:  Table [dw].[DimService]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimService](
	[ServiceKey] [bigint] NULL,
	[ServiceCode] [nvarchar](max) NULL,
	[ServiceName] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[ListPrice] [float] NULL,
	[EstMinutes] [bigint] NULL,
	[IsAddon] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
