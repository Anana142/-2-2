using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SessionTWoPartTwo1803.DataBaseFolder;

public partial class TestDataBaseContext : DbContext
{
    public TestDataBaseContext()
    {
    }

    public TestDataBaseContext(DbContextOptions<TestDataBaseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Condition> Conditions { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<Doctor> Doctors { get; set; }

    public virtual DbSet<Gender> Genders { get; set; }

    public virtual DbSet<Hospitalization> Hospitalizations { get; set; }

    public virtual DbSet<InsuransyPolise> InsuransyPolises { get; set; }

    public virtual DbSet<InsurnsyCompany> InsurnsyCompanies { get; set; }

    public virtual DbSet<Patient> Patients { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Schedule> Schedules { get; set; }

    public virtual DbSet<Specialization> Specializations { get; set; }

    public virtual DbSet<TableTime> TableTimes { get; set; }

    public virtual DbSet<TherapeuticDiagnostic> TherapeuticDiagnostics { get; set; }

    public virtual DbSet<Type> Types { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server=localhost;database=TestDataBase;TrustServerCertificate=true;Trusted_Connection=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Condition>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Department>(entity =>
        {
            entity.ToTable("Department");

            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Doctor>(entity =>
        {
            entity.ToTable("Doctor");

            entity.Property(e => e.FirstName).HasMaxLength(250);
            entity.Property(e => e.LastName).HasMaxLength(250);
            entity.Property(e => e.Patronymic).HasMaxLength(250);

            entity.HasOne(d => d.Role).WithMany(p => p.Doctors)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_Doctor_Role");

            entity.HasOne(d => d.Specialization).WithMany(p => p.Doctors)
                .HasForeignKey(d => d.SpecializationId)
                .HasConstraintName("FK_Doctor_Specialization");
        });

        modelBuilder.Entity<Gender>(entity =>
        {
            entity.ToTable("Gender");

            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Hospitalization>(entity =>
        {
            entity.ToTable("Hospitalization");

            entity.Property(e => e.AdditionInformation).HasMaxLength(250);
            entity.Property(e => e.BedNumber).HasMaxLength(10);
            entity.Property(e => e.Diagnoz).HasMaxLength(250);
            entity.Property(e => e.Purpose).HasMaxLength(250);
            entity.Property(e => e.StartDate).HasColumnType("date");

            entity.HasOne(d => d.Condition).WithMany(p => p.Hospitalizations)
                .HasForeignKey(d => d.ConditionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Hospitalization_Conditions");

            entity.HasOne(d => d.Department).WithMany(p => p.Hospitalizations)
                .HasForeignKey(d => d.DepartmentId)
                .HasConstraintName("FK_Hospitalization_Department");

            entity.HasOne(d => d.MedicCardCodeNavigation).WithMany(p => p.Hospitalizations)
                .HasForeignKey(d => d.MedicCardCode)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Hospitalization_Patient");
        });

        modelBuilder.Entity<InsuransyPolise>(entity =>
        {
            entity.ToTable("InsuransyPolise");

            entity.Property(e => e.DateStop).HasColumnType("date");

            entity.HasOne(d => d.InsuransyCompany).WithMany(p => p.InsuransyPolises)
                .HasForeignKey(d => d.InsuransyCompanyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_InsuransyPolise_InsurnsyCompany");
        });

        modelBuilder.Entity<InsurnsyCompany>(entity =>
        {
            entity.ToTable("InsurnsyCompany");

            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Patient>(entity =>
        {
            entity.HasKey(e => e.MedicCardCode);

            entity.ToTable("Patient");

            entity.Property(e => e.MedicCardCode).ValueGeneratedNever();
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.Birthday).HasColumnType("date");
            entity.Property(e => e.DateLastVisit).HasColumnType("date");
            entity.Property(e => e.DateMedicCardGet).HasColumnType("date");
            entity.Property(e => e.DateNextVisit).HasColumnType("date");
            entity.Property(e => e.Email).HasMaxLength(250);
            entity.Property(e => e.FirstName).HasMaxLength(250);
            entity.Property(e => e.History).HasMaxLength(250);
            entity.Property(e => e.LastName).HasMaxLength(250);
            entity.Property(e => e.PasportNumber).HasMaxLength(6);
            entity.Property(e => e.PasportSries).HasMaxLength(4);
            entity.Property(e => e.Patronymic).HasMaxLength(250);
            entity.Property(e => e.PhoneNumber).HasMaxLength(17);
            entity.Property(e => e.Photo).HasColumnType("image");
            entity.Property(e => e.WorkPlace).HasMaxLength(250);

            entity.HasOne(d => d.Gender).WithMany(p => p.Patients)
                .HasForeignKey(d => d.GenderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Patient_Gender");

            entity.HasOne(d => d.InsuransyPolisy).WithMany(p => p.Patients)
                .HasForeignKey(d => d.InsuransyPolisyId)
                .HasConstraintName("FK_Patient_InsuransyPolise");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Role");

            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Schedule>(entity =>
        {
            entity.ToTable("Schedule");

            entity.Property(e => e.Date).HasColumnType("date");

            entity.HasOne(d => d.Doctor).WithMany(p => p.Schedules)
                .HasForeignKey(d => d.DoctorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Schedule_Doctor");
        });

        modelBuilder.Entity<Specialization>(entity =>
        {
            entity.ToTable("Specialization");

            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<TableTime>(entity =>
        {
            entity.ToTable("TableTime");

            entity.HasOne(d => d.PatientMedicCardCodeNavigation).WithMany(p => p.TableTimes)
                .HasForeignKey(d => d.PatientMedicCardCode)
                .HasConstraintName("FK_TableTime_Patient");

            entity.HasOne(d => d.Schedule).WithMany(p => p.TableTimes)
                .HasForeignKey(d => d.ScheduleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TableTime_Schedule");
        });

        modelBuilder.Entity<TherapeuticDiagnostic>(entity =>
        {
            entity.ToTable("TherapeuticDiagnostic");

            entity.Property(e => e.Cost).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.Recommendation).HasMaxLength(250);
            entity.Property(e => e.Rezult).HasMaxLength(250);

            entity.HasOne(d => d.Doctor).WithMany(p => p.TherapeuticDiagnostics)
                .HasForeignKey(d => d.DoctorId)
                .HasConstraintName("FK_TherapeuticDiagnostic_Doctor");

            entity.HasOne(d => d.MedicCardCodeNavigation).WithMany(p => p.TherapeuticDiagnostics)
                .HasForeignKey(d => d.MedicCardCode)
                .HasConstraintName("FK_TherapeuticDiagnostic_Patient");

            entity.HasOne(d => d.Type).WithMany(p => p.TherapeuticDiagnostics)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_TherapeuticDiagnostic_Type");
        });

        modelBuilder.Entity<Type>(entity =>
        {
            entity.ToTable("Type");

            entity.Property(e => e.Name).HasMaxLength(250);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
