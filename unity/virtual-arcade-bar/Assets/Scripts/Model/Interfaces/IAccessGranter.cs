using System;

namespace Model.Interfaces
{
    public interface IAccessGranter
    {
        event Action<Patron> AccessGranted;
        void GrantAccess(Patron patron);
    }
}
