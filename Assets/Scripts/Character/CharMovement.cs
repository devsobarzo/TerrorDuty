using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BASA
{
    public class CharMovement : MonoBehaviour
    {

        [Header("Character's setup")]
        public CharacterController controller;
        public float speed = 6f;
        public float heightJump = 3f;
        public float gravity = -20f;
        public bool isRunning;
        public AudioClip[] sounds;
        AudioSource sound;
        bool onScene;

        [Header("Checks ground")]
        public Transform checkGround;
        public float radiousSphere = 0.4f;
        public LayerMask groundMask;
        public bool isOnGround;
        Vector3 speedFall;

        [Header("Checks Bend")]
        public Transform cameraTransform;
        public bool isBend;
        public bool upBlocked;
        public float heightUp, heightDown, posCamUp, posCamDown;
        float speedCurrent = 1f;
        RaycastHit hit;

        [Header("Character's status")]
        public float hp = 100;
        public float stamina = 100;
        public bool tired;
        public Breathing scriptBreath;



        void Start()
        {
            tired = false;
            isRunning = false;
            controller = GetComponent<CharacterController>();
            isBend = false;
            cameraTransform = Camera.main.transform;
            sound = GetComponent<AudioSource>();
            onScene = false;
        }


        void Update()
        {
            Checks();
            MovementBends();
            Inputs();
            ConditionPlayer();
            Sounds();
        }

        void Sounds()
        {
            if (!isOnGround)
            {
                onScene = true;
            }
            if (isOnGround && onScene)
            {
                onScene = false;
                sound.clip = sounds[1];
                sound.Play();
            }
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
            if (Input.GetKey(KeyCode.LeftShift) && isOnGround && !isBend && !tired)
            {
                isRunning = true;
                speed = 9;
                stamina -= 0.3f;
                stamina = Mathf.Clamp(stamina, 0, 100);
            }
            else
            {
                isRunning = false;
                stamina += 0.1f;
                stamina = Mathf.Clamp(stamina, 0, 100);
            }

            if (Input.GetButtonDown("Jump") && isOnGround)
            {
                speedFall.y = Mathf.Sqrt(heightJump * -2f * gravity);
                sound.clip = sounds[0];
                sound.Play();
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

        void ConditionPlayer()
        {
            if (stamina == 0)
            {
                tired = true;
                scriptBreath.forceBreath = 5;
            }

            if (stamina > 20)
            {
                tired = false;
            }
        }
        void OnTriggerStay(Collider col)
        {
            if (col.gameObject.CompareTag("HeadDisabled"))
            {
                controller.SimpleMove(transform.forward * 1000 * Time.deltaTime);
            }
        }
    }
}
