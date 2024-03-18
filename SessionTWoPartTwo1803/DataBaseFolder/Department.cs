using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class Department
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Hospitalization> Hospitalizations { get; set; } = new List<Hospitalization>();
}
