using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ragdoll : MonoBehaviour
{

    List<Rigidbody> ragRigis = new List<Rigidbody>();
    public Rigidbody rigid;
    List<Collider> ragColliders = new List<Collider>();


    void Start()
    {
        rigid = GetComponent<Rigidbody>();
    }


    public void RagdollDisabled()
    {
        Rigidbody[] rigs = GetComponentsInChildren<Rigidbody>();

        for (int i = 0; i < rigs.Length; i++)
        {
            if (rigs[i] == rigid)
            {
                continue;
            }

            ragRigis.Add(rigs[i]);
            rigs[i].isKinematic = true;

            Collider col = rigs[i].gameObject.GetComponent<Collider>();
            col.enabled = false;
            ragColliders.Add(col);
        }
    }

    public void RagdollEnabled()
    {
        for (int i = 0; i < ragRigis.Count; i++)
        {
            ragRigis[i].isKinematic = false;
            ragColliders[i].enabled = true;
            ragRigis[i].transform.gameObject.layer = 8;
        }
        rigid.isKinematic = true;
        GetComponent<CapsuleCollider>().enabled = false;
        StartCoroutine("AnimationsEnd");
    }

    IEnumerator AnimationsEnd()
    {
        yield return new WaitForEndOfFrame();
        GetComponent<Animator>().enabled = false;
        this.enabled = false;
    }
}
