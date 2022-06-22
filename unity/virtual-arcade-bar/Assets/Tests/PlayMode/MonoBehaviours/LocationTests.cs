using System.Collections;
using MonoBehaviours;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

namespace Tests.PlayMode.MonoBehaviours
{
    public class LocationTests
    {
        [UnityTest]
        public IEnumerator LocationCanBeOpened()
        {
            var sut = new GameObject().AddComponent<Location>();
            var testEventCalled = false;
            sut.Opened += () => testEventCalled = true;
            yield return null;

            sut.Open();

            Assert.IsTrue(testEventCalled);
        }

        [UnityTest]
        public IEnumerator PatronCanBeAdmittedToLocation()
        {
            var sut = new GameObject().AddComponent<Location>();
            var testPatron = new GameObject().AddComponent<Patron>();
            Model.Patron admittedPatron = null;
            sut.PatronAccessGranted += patron => admittedPatron = patron;
            yield return null;

            sut.GrantAccess(testPatron.PatronInstance);

            Assert.AreEqual(testPatron.PatronInstance, admittedPatron);
        }

        [UnityTest]
        public IEnumerator ServicePersonCanBeAdmittedToLocation()
        {
            var testServicePerson = new GameObject().AddComponent<ServicePerson>();
            var sut = new GameObject().AddComponent<Location>();
            Model.ServicePerson admittedServicePerson = null;
            sut.ServicePersonAccessGranted += servicePerson => admittedServicePerson = servicePerson;
            yield return null;

            sut.GrantAccess(testServicePerson.ServicePersonInstance);
            

            Assert.AreEqual(testServicePerson.ServicePersonInstance, admittedServicePerson);
        }

    }
}