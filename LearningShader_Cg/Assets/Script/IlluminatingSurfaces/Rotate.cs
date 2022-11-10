using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotate : MonoBehaviour
{
    [SerializeField] float rotationSpeed = 1f;
    void Update()
    {
        transform.Rotate(0, Time.deltaTime * rotationSpeed, 0);
    }
}
