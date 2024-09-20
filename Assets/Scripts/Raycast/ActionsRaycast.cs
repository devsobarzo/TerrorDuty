using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace BASA
{
    [RequireComponent(typeof(RaycastScript))]

    public class ActionsRaycast : MonoBehaviour
    {
        RaycastScript raycastScript;
        public bool took;
        float distance;
        public GameObject saveObjet;

        void Start()
        {
            raycastScript = GetComponent<RaycastScript>();
            took = false;

        }


        void Update()
        {
            distance = raycastScript.distanceTarget;

            if (distance <= 3)
            {
                if (Input.GetKeyDown(KeyCode.E) && raycastScript.objTake != null)
                {
                    ToTake();
                }

                if (Input.GetKeyDown(KeyCode.E) && raycastScript.objLift != null)
                {
                    if (!took)
                    {
                        took = true;
                        ToLift();
                    }
                    else
                    {
                        took = false;
                        ToLeave();
                    }
                }
            }

        }
        void ToLift()
        {
            raycastScript.objLift.GetComponent<Rigidbody>().isKinematic = true;
            raycastScript.objLift.GetComponent<Rigidbody>().useGravity = false;
            raycastScript.objLift.transform.SetParent(transform);
            raycastScript.objLift.transform.localPosition = new Vector3(0, 0, 3);
            raycastScript.objLift.transform.localRotation = Quaternion.Euler(0, 0, 0);
        }

        void ToLeave()
        {
            raycastScript.objLift.transform.localPosition = new Vector3(0, 0, 3);
            raycastScript.objLift.transform.SetParent(null);

            raycastScript.objLift.GetComponent<Rigidbody>().isKinematic = false;
            raycastScript.objLift.GetComponent<Rigidbody>().useGravity = true;
        }

        void ToTake()
        {
            Destroy(raycastScript.objTake);
        }


    }
}
