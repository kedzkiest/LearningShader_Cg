using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DisplayRotate : MonoBehaviour
{
    [SerializeField] private float selfRotationSpeed;
    [SerializeField] private float aroundRotationSpeed;
    [SerializeField] private Vector3 center;
    [SerializeField] private float xAmplitude;
    [SerializeField] private float yAmplitude;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.position = new Vector3(center.x + Mathf.Cos(Time.time * aroundRotationSpeed) * xAmplitude,
                                        center.y + Mathf.Sin(Time.time * aroundRotationSpeed) * yAmplitude, 
                                        0);
        transform.Rotate(0, Time.deltaTime * selfRotationSpeed, 0);
    }
}
