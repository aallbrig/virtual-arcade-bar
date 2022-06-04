using System.Collections;
using MonoBehaviours;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
using Location = Model.Location;

namespace Tests.PlayMode.MonoBehaviours
{
    public class ServicePersonTests
    {
        [UnityTest]
        public IEnumerator ServicePersonCanBeAdmittedToLocation()
        {
            var sut = new GameObject().AddComponent<ServicePerson>();
            var testLocation = Model.Location.CreateInstance();
            Model.ServicePerson realServicePerson = null;
            testLocation.ServicePersonAccessGranted += servicePerson => realServicePerson = servicePerson;
            yield return null;
            
            testLocation.GrantAccess(sut.ServicePersonInstance);

            Assert.AreEqual(sut.ServicePersonInstance, realServicePerson);
        }
    }
}