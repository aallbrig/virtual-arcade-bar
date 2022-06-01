using System.Collections;
using MonoBehaviours;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

namespace Tests.PlayMode.MonoBehaviours
{
    public class PatronTests
    {
        [UnityTest]
        public IEnumerator PatronCanBeAdmittedToLocation()
        {
            var testLocation = Model.Location.CreateInstance();
            var sut = new GameObject().AddComponent<Patron>();
            Model.Patron realPatron = null;
            testLocation.AccessGranted += patron => realPatron = patron;
            yield return null;

            testLocation.GrantAccess(sut.PatronInstance);

            Assert.AreEqual(sut.PatronInstance, realPatron);
            
        }
    }
}