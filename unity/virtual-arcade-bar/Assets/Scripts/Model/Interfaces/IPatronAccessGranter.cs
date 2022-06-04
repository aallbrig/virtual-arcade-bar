using System;

namespace Model.Interfaces
{
    public interface IPatronAccessGranter
    {
        event Action<Patron> PatronAccessGranted;
        void GrantAccess(Patron patron);
    }
}
