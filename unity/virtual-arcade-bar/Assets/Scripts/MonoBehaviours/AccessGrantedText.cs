using System;
using TMPro;
using UnityEngine;

namespace MonoBehaviours
{
public class AccessGrantedText : MonoBehaviour
{
    public TextMeshProUGUI text;
    public float textDisplayTimeInSeconds = 1f;
    private float _textUpdateTime;
    private bool _activelyDetecting;
    private void Start()
    {
        if (text == null)
        {
            throw new ArgumentException($"text must be set by a game designer in the unity editor");
        }
        text.text = "";
    }

    private void Update()
    {
        if (_activelyDetecting == true && Time.time - _textUpdateTime > textDisplayTimeInSeconds)
        {
            ResetTextDetection();
        }
    }

    private void ResetTextDetection()
    {
        _activelyDetecting = false;
        text.text = "";
    }
    private void WriteToText(Model.Patron patron)
    {
        text.text = $"Access granted for patron {patron}";
        _textUpdateTime = Time.time;
        _activelyDetecting = true;
    }

    // Used in a UnityEvent, set by game designers in the unity editor
    public void OnAccessGranted(Model.Patron patron)
    {
        WriteToText(patron);
    }
}
}
