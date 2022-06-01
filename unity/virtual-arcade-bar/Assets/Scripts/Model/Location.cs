using System;
using Model.Interfaces;
using MonoBehaviours;

namespace Model
{
    public class Location: IOpen, IAccessGranter
    {
        public static Location CreateInstance()
        {
            return new Location();
        }

        public event Action Opened;

        public void Open() => Opened?.Invoke();

        public event Action<Patron> AccessGranted;

        public void GrantAccess(Patron patron) => AccessGranted?.Invoke(patron);
    }
}
