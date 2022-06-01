using System;
using Model.Interfaces;
using UnityEngine;

namespace MonoBehaviours
{
    public class Location : MonoBehaviour, IOpen, IAccessGranter
    {
        private Model.Location _location;

        private void Start()
        {
            _location ??= Model.Location.CreateInstance();
            _location.Opened += () => Opened?.Invoke();
            _location.AccessGranted += patron => AccessGranted?.Invoke(patron);
        }

        public event Action Opened;

        public void Open() => _location.Open();

        public event Action<Model.Patron> AccessGranted;

        public void GrantAccess(Model.Patron patron) {
            _location.GrantAccess(patron);
        }
    }
}
