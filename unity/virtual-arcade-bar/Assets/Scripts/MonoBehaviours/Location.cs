using System;
using System.Collections.Generic;
using Model.Interfaces;
using UnityEngine;
using UnityEngine.Events;

namespace MonoBehaviours
{
    public class Location : MonoBehaviour, IOpen, IPatronAccessGranter, IServicePersonAccessGranter
    {
        public List<UnityEvent<Model.Patron>> onPatronAccessGranted = new List<UnityEvent<Model.Patron>>();
        public List<UnityEvent<Model.ServicePerson>> onServicePersonAccessGranted = new List<UnityEvent<Model.ServicePerson>>();
        private Model.Location _location;

        private void Start()
        {
            _location ??= Model.Location.CreateInstance();
            _location.Opened += () => Opened?.Invoke();
            _location.PatronAccessGranted += patron =>
            {
                onPatronAccessGranted.ForEach(fn => fn?.Invoke(patron));
                PatronAccessGranted?.Invoke(patron);
            };
            _location.ServicePersonAccessGranted += servicePerson =>
            {
                onServicePersonAccessGranted.ForEach(fn => fn?.Invoke(servicePerson));
                ServicePersonAccessGranted?.Invoke(servicePerson);
            };
        }

        public event Action Opened;

        public void Open() => _location.Open();

        public event Action<Model.Patron> PatronAccessGranted;

        public void GrantAccess(Model.Patron patron) {
            _location.GrantAccess(patron);
        }

        public event Action<Model.ServicePerson> ServicePersonAccessGranted;

        public void GrantAccess(Model.ServicePerson servicePerson) {
            _location.GrantAccess(servicePerson);
        }

        private void OnTriggerEnter(Collider other)
        {
            var maybePatron = other.transform.GetComponent<Patron>();
            if (maybePatron)
                GrantAccess(maybePatron.PatronInstance);

            var maybeServicePerson = other.transform.GetComponent<ServicePerson>();
            if (maybeServicePerson)
                GrantAccess(maybeServicePerson.ServicePersonInstance);
        }
    }
}
