using System;
using UnityEngine;

namespace MonoBehaviours
{
    public class ServicePerson : MonoBehaviour
    {
        public Model.ServicePerson ServicePersonInstance;

        private void Start()
        {
            ServicePersonInstance ??= Model.ServicePerson.CreateInstance();
        }
    }
}
