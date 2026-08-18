/****** Object:  Table [dw].[DimCustomer]    Script Date: 8/11/2026 3:23:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimCustomer](
	[CustomerKey] [bigint] NULL,
	[CustomerNameNormalized] [nvarchar](max) NULL,
	[CustomerName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[LeadSource] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](0) NULL,
	[ConsentSms] [bigint] NULL,
	[ConsentEmail] [bigint] NULL,
	[UtmSource] [nvarchar](max) NULL,
	[UtmMedium] [nvarchar](max) NULL,
	[UtmCampaign] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[HasPaymentOnFile] [bigint] NULL,
	[WasDeduplicated] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
