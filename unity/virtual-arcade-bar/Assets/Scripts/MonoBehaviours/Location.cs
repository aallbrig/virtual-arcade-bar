using System;
using Model.Interfaces;
using UnityEngine;

namespace MonoBehaviours
{
    public class Location : MonoBehaviour, IOpen
    {
        private Model.Location _location;
        private void Start()
        {
            _location ??= Model.Location.CreateInstance();
            _location.Opened += () => Opened?.Invoke();
        }

        public event Action Opened;

        public void Open() => _location.Open();
    }
}
