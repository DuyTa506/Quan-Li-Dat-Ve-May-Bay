//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace demo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PhieuDatVe
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuDatVe()
        {
            this.KhachHang_DatVe = new HashSet<KhachHang_DatVe>();
            this.PhieuDatVe_HanhLy = new HashSet<PhieuDatVe_HanhLy>();
            this.Ves = new HashSet<Ve>();
        }
    
        public int MaPhieuDatVe { get; set; }
        public Nullable<System.DateTime> NgayDat { get; set; }
        public Nullable<int> MaChuyenBay { get; set; }
        public string MaLoaiVe { get; set; }
    
        public virtual ChuyenBay ChuyenBay { get; set; }
        public virtual LoaiVe LoaiVe { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KhachHang_DatVe> KhachHang_DatVe { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuDatVe_HanhLy> PhieuDatVe_HanhLy { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ve> Ves { get; set; }
    }
}
