using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyEffects : MonoBehaviour
{


    public float time = 0;

    void Start()
    {
        Destroy(this.gameObject, time);

    }


}
