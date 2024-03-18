using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class Schedule
{
    public int Id { get; set; }

    public TimeSpan TimeStartDay { get; set; }

    public TimeSpan TimeEndDay { get; set; }

    public int? Aproval { get; set; }

    public int? Archive { get; set; }

    public DateTime Date { get; set; }

    public int DoctorId { get; set; }

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual ICollection<TableTime> TableTimes { get; set; } = new List<TableTime>();
}
