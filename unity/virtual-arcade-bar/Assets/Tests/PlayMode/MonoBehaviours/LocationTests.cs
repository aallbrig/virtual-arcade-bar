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
        public IEnumerator LocationExists()
        {
            var sut = new GameObject().AddComponent<Location>();
            var testEventCalled = false;
            sut.Opened += () => testEventCalled = true;
            yield return null;

            sut.Open();

            Assert.IsTrue(testEventCalled);
        }
    }
}