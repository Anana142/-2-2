using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class TherapeuticDiagnostic
{
    public int Id { get; set; }

    public int? MedicCardCode { get; set; }

    public int? DoctorId { get; set; }

    public int? TypeId { get; set; }

    public string? Name { get; set; }

    public string? Rezult { get; set; }

    public string? Recommendation { get; set; }

    public decimal? Cost { get; set; }

    public virtual Doctor? Doctor { get; set; }

    public virtual Patient? MedicCardCodeNavigation { get; set; }

    public virtual Type? Type { get; set; }
}
