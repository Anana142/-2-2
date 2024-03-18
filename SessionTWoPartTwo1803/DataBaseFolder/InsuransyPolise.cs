using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class InsuransyPolise
{
    public int Id { get; set; }

    public DateTime DateStop { get; set; }

    public int InsuransyCompanyId { get; set; }

    public virtual InsurnsyCompany InsuransyCompany { get; set; } = null!;

    public virtual ICollection<Patient> Patients { get; set; } = new List<Patient>();
}
