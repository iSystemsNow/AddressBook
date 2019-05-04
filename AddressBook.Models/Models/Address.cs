using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AddressBook.Models.Models
{
    [Table("Address")]
    public class Address
    {
        [Key]
        public int Id { get; set; }
        public int ContactId { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public int ProvinceStateId { get; set; }
        public string PostalZip { get; set; }
        public string PhoneNumber { get; set; }
        public int CountryId { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
