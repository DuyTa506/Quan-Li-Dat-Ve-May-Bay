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
    
    public partial class ChangBay
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChangBay()
        {
            this.ChuyenBays = new HashSet<ChuyenBay>();
        }
    
        public int MaChangBay { get; set; }
        public string SanBay_CatCanh { get; set; }
        public string SanBay_HaCanh { get; set; }
    
        public virtual SanBay SanBay { get; set; }
        public virtual SanBay SanBay1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChuyenBay> ChuyenBays { get; set; }
    }
}
