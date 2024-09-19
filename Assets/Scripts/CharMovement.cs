using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BASA
{
    public class CharMovement : MonoBehaviour
    {
        public CharacterController controller;
        public float speed = 6f;
        public float heightJump = 3f;
        public float gravity = -20f;

        public Transform checkGround;
        public float radiousSphere = 0.4f;
        public LayerMask groundMask;
        public bool isOnGround;

        Vector3 speedFall;

        void Start()
        {
            controller = GetComponent<CharacterController>();
        }


        void Update()
        {
            isOnGround = Physics.CheckSphere(checkGround.position, radiousSphere, groundMask);

            if (isOnGround && speedFall.y < 0)
            {
                speedFall.y = -2f;
            }

            float x = Input.GetAxis("Horizontal");
            float z = Input.GetAxis("Vertical");

            Vector3 move = (transform.right * x + transform.forward * z).normalized;

            controller.Move(move * speed * Time.deltaTime);

            if (Input.GetButtonDown("Jump") && isOnGround)
            {
                speedFall.y = Mathf.Sqrt(heightJump * -2f * gravity);
            }

            speedFall.y += gravity * Time.deltaTime;
            controller.Move(speedFall * Time.deltaTime);
        }

        void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawSphere(checkGround.position, radiousSphere);
        }
    }
}
