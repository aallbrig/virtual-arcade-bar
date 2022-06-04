using System;

namespace Model.Interfaces
{
    public interface IServicePersonAccessGranter
    {
        event Action<ServicePerson> ServicePersonAccessGranted;
        void GrantAccess(ServicePerson servicePerson);
    }
}
