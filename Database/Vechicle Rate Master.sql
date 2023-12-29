USE [DBstudent]
GO

/****** Object:  Table [dbo].[vehicle_rate_mst]    Script Date: 6/13/2019 5:05:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[vehicle_rate_mst](
	[vehicle_rate_id] [bigint] IDENTITY(1,1) NOT NULL,
	[vehicle_id] [bigint] NOT NULL,
	[rate] [float] NOT NULL,
	[from_date] [date] NOT NULL,
	[to_date] [date] NOT NULL,
 CONSTRAINT [PK_vehicle_rate_mst] PRIMARY KEY CLUSTERED 
(
	[vehicle_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


