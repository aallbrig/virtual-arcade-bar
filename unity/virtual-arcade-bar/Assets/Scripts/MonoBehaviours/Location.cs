using System;
using System.Collections.Generic;
using Model.Interfaces;
using UnityEngine;
using UnityEngine.Events;

namespace MonoBehaviours
{
    public class Location : MonoBehaviour, IOpen, IAccessGranter
    {
        public List<UnityEvent<Model.Patron>> onAccessGranted = new List<UnityEvent<Model.Patron>>();
        private Model.Location _location;

        // Used in a UnityEvent action on the prefab
        public static void LogPatron(Model.Patron patron)
        {
            Debug.Log($"access granted to patron {patron}");
        }

        private void Start()
        {
            _location ??= Model.Location.CreateInstance();
            _location.Opened += () => Opened?.Invoke();
            _location.AccessGranted += patron =>
            {
                onAccessGranted.ForEach(fn => fn?.Invoke(patron));
                AccessGranted?.Invoke(patron);
            };
        }

        public event Action Opened;

        public void Open() => _location.Open();

        public event Action<Model.Patron> AccessGranted;

        public void GrantAccess(Model.Patron patron) {
            _location.GrantAccess(patron);
        }

        private void OnTriggerEnter(Collider other)
        {
            var maybePatron = other.transform.GetComponent<Patron>();
            if (maybePatron)
                _location.GrantAccess(maybePatron.PatronInstance);
        }
    }
}
