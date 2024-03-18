using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class TableTime
{
    public int Id { get; set; }

    public TimeSpan TimeStartGap { get; set; }

    public TimeSpan TimeEndGap { get; set; }

    public int? PatientMedicCardCode { get; set; }

    public int? SpecialEvent { get; set; }

    public int ScheduleId { get; set; }

    public virtual Patient? PatientMedicCardCodeNavigation { get; set; }

    public virtual Schedule Schedule { get; set; } = null!;
}
