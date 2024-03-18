using System;
using System.Collections.Generic;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class Patient
{
    public int MedicCardCode { get; set; }

    public byte[]? Photo { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public string PasportSries { get; set; } = null!;

    public string PasportNumber { get; set; } = null!;

    public DateTime Birthday { get; set; }

    public int GenderId { get; set; }

    public string Address { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public string? Email { get; set; }

    public DateTime DateMedicCardGet { get; set; }

    public DateTime? DateLastVisit { get; set; }

    public DateTime? DateNextVisit { get; set; }

    public int? InsuransyPolisyId { get; set; }

    public string? History { get; set; }

    public string? WorkPlace { get; set; }

    public virtual Gender Gender { get; set; } = null!;

    public virtual ICollection<Hospitalization> Hospitalizations { get; set; } = new List<Hospitalization>();

    public virtual InsuransyPolise? InsuransyPolisy { get; set; }

    public virtual ICollection<TableTime> TableTimes { get; set; } = new List<TableTime>();

    public virtual ICollection<TherapeuticDiagnostic> TherapeuticDiagnostics { get; set; } = new List<TherapeuticDiagnostic>();
}
