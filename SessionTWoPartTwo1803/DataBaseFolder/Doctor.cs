using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class Doctor
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public int? RoleId { get; set; }

    public int? SpecializationId { get; set; }

    public virtual Role? Role { get; set; }

    public virtual ICollection<Schedule> Schedules { get; set; } = new List<Schedule>();

    public virtual Specialization? Specialization { get; set; }

    public virtual ICollection<TherapeuticDiagnostic> TherapeuticDiagnostics { get; set; } = new List<TherapeuticDiagnostic>();
}
