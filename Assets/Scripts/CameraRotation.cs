using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraRotation : MonoBehaviour
{
    public float sensibilityMouse = 100f;
    public float angleMin = -45f, angleMax = 45f;

    public Transform transformPlayer;

    float rotation = 0f;

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }


    void Update()
    {
        float mouseX = Input.GetAxis("Mouse X") * sensibilityMouse * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * sensibilityMouse * Time.deltaTime;

        rotation -= mouseY;
        rotation = Mathf.Clamp(rotation, angleMin, angleMax);

        transform.localRotation = Quaternion.Euler(rotation, 0, 0);

        transformPlayer.Rotate(Vector3.up * mouseX);
    }
}
