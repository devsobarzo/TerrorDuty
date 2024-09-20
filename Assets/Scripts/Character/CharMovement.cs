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

        public Transform cameraTransform;
        public bool isBend;
        public bool upBlocked;
        public float heightUp, heightDown, posCamUp, posCamDown;
        RaycastHit hit;

        void Start()
        {
            controller = GetComponent<CharacterController>();
            isBend = false;
            cameraTransform = Camera.main.transform;
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

            if (isBend)
            {
                CheckBlockedDown();
            }

            if (Input.GetKeyDown(KeyCode.LeftControl))
            {
                Bend();
            }
        }

        void Bend()
        {
            if (upBlocked || isOnGround == false)
            {
                return;
            }

            isBend = !isBend;
            if (isBend)
            {
                controller.height = heightDown;
                cameraTransform.localPosition = new Vector3(0, posCamDown, 0);
            }
            else
            {
                controller.height = heightUp;
                cameraTransform.localPosition = new Vector3(0, posCamUp, 0);
            }
        }

        void CheckBlockedDown()
        {
            Debug.DrawRay(cameraTransform.position, Vector3.up * 1.1f, Color.red);

            if (Physics.Raycast(cameraTransform.position, Vector3.up, out hit, 1.1f))
            {
                upBlocked = true;
            }
            else
            {
                upBlocked = false;
            }
        }

        void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawSphere(checkGround.position, radiousSphere);
        }
    }
}
