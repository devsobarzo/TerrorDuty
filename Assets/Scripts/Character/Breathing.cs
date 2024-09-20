using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Breathing : MonoBehaviour
{

    public bool isBreathing = true;
    public float minHeight = -0.035f;
    public float maxHeight = 0.035f;

    [Range(0f, 5f)]
    public float forceBreath = 1f;

    float movement;


    void Update()
    {
        if (isBreathing)
        {
            movement = Mathf.Lerp(movement, maxHeight, Time.deltaTime * 1 * forceBreath);
            transform.localPosition = new Vector3(transform.localPosition.x, movement, transform.localPosition.z);
            if (movement >= maxHeight - 0.01f)
            {
                isBreathing = !isBreathing;
            }
        }
        else
        {
            movement = Mathf.Lerp(movement, minHeight, Time.deltaTime * 1 * forceBreath);
            transform.localPosition = new Vector3(transform.localPosition.x, movement, transform.localPosition.z);
            if (movement <= minHeight + 0.01f)
            {
                isBreathing = !isBreathing;
            }
        }

        if (forceBreath != 0)
        {
            forceBreath = Mathf.Lerp(forceBreath, 1f, Time.deltaTime * 0.2f);
        }
    }
}
