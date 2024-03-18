using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class Hospitalization
{
    public int Id { get; set; }

    public int MedicCardCode { get; set; }

    public string Diagnoz { get; set; } = null!;

    public string? Purpose { get; set; }

    public int? DepartmentId { get; set; }

    public int ConditionId { get; set; }

    public int? Length { get; set; }

    public string? AdditionInformation { get; set; }

    public DateTime? StartDate { get; set; }

    public int? RoomNumber { get; set; }

    public string? BedNumber { get; set; }

    public virtual Condition Condition { get; set; } = null!;

    public virtual Department? Department { get; set; }

    public virtual Patient MedicCardCodeNavigation { get; set; } = null!;
}
