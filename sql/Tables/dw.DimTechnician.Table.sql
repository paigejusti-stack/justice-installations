/****** Object:  Table [dw].[DimTechnician]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimTechnician](
	[TechnicianKey] [bigint] NULL,
	[TechnicianId] [nvarchar](max) NULL,
	[TechnicianName] [nvarchar](max) NULL,
	[HireDate] [datetime2](0) NULL,
	[Specialty] [nvarchar](max) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
