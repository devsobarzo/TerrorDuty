using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

namespace BASA
{
    public class RaycastScript : MonoBehaviour
    {

        public float distanceTarget;
        public GameObject objLift, objTake;
        RaycastHit hit;
        public TextMeshProUGUI textBtn, textInfo;

        void Update()
        {
            if (Time.frameCount % 5 == 0)
            {
                Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.forward) * 5, Color.red);
                if (Physics.SphereCast(transform.position, 0.1f, transform.TransformDirection(Vector3.forward), out hit, 5))
                {
                    distanceTarget = hit.distance;
                    print(hit.transform.gameObject.name);

                    if (hit.transform.gameObject.tag == "objLift")
                    {
                        objLift = hit.transform.gameObject;
                        objTake = null;
                        textBtn.text = "(E)";
                        textInfo.text = "Lift it & Leave it";
                    }

                    if (hit.transform.gameObject.tag == "objTake")
                    {
                        objTake = hit.transform.gameObject;
                        objLift = null;
                        textBtn.text = "(E)";
                        textInfo.text = "Take it & Leave it";
                    }

                }
                else
                {
                    textBtn.text = "";
                    textInfo.text = "";
                    objLift = null;
                    objTake = null;
                }
            }

        }

    }
}
