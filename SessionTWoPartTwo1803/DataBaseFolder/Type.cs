using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class Type
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<TherapeuticDiagnostic> TherapeuticDiagnostics { get; set; } = new List<TherapeuticDiagnostic>();
} 
