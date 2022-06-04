using System;
using Model.Interfaces;

namespace Model
{
    public class Location: IOpen, IPatronAccessGranter, IServicePersonAccessGranter
    {
        public static Location CreateInstance()
        {
            return new Location();
        }

        public event Action Opened;

        public void Open() => Opened?.Invoke();

        public event Action<Patron> PatronAccessGranted;
        public event Action<ServicePerson> ServicePersonAccessGranted;

        public void GrantAccess(Patron patron) => PatronAccessGranted?.Invoke(patron);
        public void GrantAccess(ServicePerson servicePerson) => ServicePersonAccessGranted?.Invoke(servicePerson);
    }
}
