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
        float speedCurrent = 1f;
        RaycastHit hit;

        public bool isRunning;

        void Start()
        {
            isRunning = false;
            controller = GetComponent<CharacterController>();
            isBend = false;
            cameraTransform = Camera.main.transform;
        }


        void Update()
        {
            Checks();
            MovementBends();
            Inputs();

        }

        void Checks()
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

            speedFall.y += gravity * Time.deltaTime;
            controller.Move(speedFall * Time.deltaTime);

        }

        void MovementBends()
        {
            controller.center = Vector3.down * (heightUp - controller.height) / 2f;

            if (isBend)
            {
                controller.height = Mathf.Lerp(controller.height, heightDown, Time.deltaTime * 3);
                float newY = Mathf.SmoothDamp(cameraTransform.localPosition.y, posCamDown, ref speedCurrent, Time.deltaTime * 3);
                cameraTransform.localPosition = new Vector3(0, newY, 0);
                speed = 3f;
                CheckBlockedDown();

            }
            else
            {
                controller.height = Mathf.Lerp(controller.height, heightUp, Time.deltaTime * 3);
                float newY = Mathf.SmoothDamp(cameraTransform.localPosition.y, posCamUp, ref speedCurrent, Time.deltaTime * 3);
                cameraTransform.localPosition = new Vector3(0, newY, 0);
                speed = 6f;
            }
        }

        void Inputs()
        {
            if (Input.GetKey(KeyCode.LeftShift) && isOnGround && !isBend)
            {
                isRunning = true;
                speed = 9;
            }
            else
            {
                isRunning = false;
            }

            if (Input.GetButtonDown("Jump") && isOnGround)
            {
                speedFall.y = Mathf.Sqrt(heightJump * -2f * gravity);
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
