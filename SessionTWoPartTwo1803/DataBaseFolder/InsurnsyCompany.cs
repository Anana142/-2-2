using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class InsurnsyCompany
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<InsuransyPolise> InsuransyPolises { get; set; } = new List<InsuransyPolise>();
}
