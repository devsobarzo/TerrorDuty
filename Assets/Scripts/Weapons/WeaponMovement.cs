using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace BASA
{
    public class WeaponMovement : MonoBehaviour
    {
        public float value;
        public float softlyValue;
        public float valueMax;
        Vector3 posStart;

        void Start()
        {
            posStart = transform.localPosition;

        }


        void Update()
        {
            float moveX = -Input.GetAxis("Mouse X") * value;
            float moveY = -Input.GetAxis("Mouse Y") * value;

            moveX = Mathf.Clamp(moveX, -valueMax, valueMax);
            moveY = Mathf.Clamp(moveY, -valueMax, valueMax);

            Vector3 finalPos = new Vector3(moveX, moveY, 0);

            transform.localPosition = Vector3.Lerp(transform.localPosition, finalPos + posStart, Time.deltaTime * softlyValue);

        }
    }
}