using System;
using Model.Interfaces;
using UnityEngine;

namespace MonoBehaviours
{
    public class Patron : MonoBehaviour
    {
        public Model.Patron PatronInstance;
        private void Start()
        {
            PatronInstance ??= Model.Patron.CreateInstance();
        }
    }
}
