using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OnMouse : MonoBehaviour
{

    public Material selected, unSelected;
    Renderer rend;

    void Start()
    {
        rend = GetComponent<Renderer>();
    }

    void OnMouseEnter()
    {
        rend.material = selected;
    }

    void OnMouseExit()
    {
        rend.material = unSelected;
    }


}
