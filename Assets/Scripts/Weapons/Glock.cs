using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Glock : MonoBehaviour
{

    Animator anim;
    bool isShooting;
    RaycastHit hit;

    public GameObject spark;
    public GameObject hole;
    public GameObject smoke;
    public GameObject shootEffects;
    public GameObject posEffShoot;
    public ParticleSystem bulletWay;
    public AudioSource audioGun;


    void Start()
    {
        isShooting = false;
        anim = GetComponent<Animator>();
        audioGun = GetComponent<AudioSource>();
    }


    void Update()
    {
        if (anim.GetBool("actions"))
        {
            return;
        }

        if (Input.GetButtonDown("Fire3"))
        {
            if (!isShooting)
            {
                audioGun.Play();
                bulletWay.Play();
                isShooting = true;
                StartCoroutine(Shooting());
            }
        }
        if (Input.GetKeyDown(KeyCode.R))
        {
            anim.Play("Recharge");
        }

    }

    IEnumerator Shooting()
    {
        float screenX = Screen.width / 2;
        float screenY = Screen.height / 2;

        Ray ray = Camera.main.ScreenPointToRay(new Vector3(screenX, screenY));
        anim.Play("Shoot");

        GameObject effectShootObj = Instantiate(shootEffects, posEffShoot.transform.position, posEffShoot.transform.rotation);
        effectShootObj.transform.parent = posEffShoot.transform;

        if (Physics.Raycast(new Vector3(ray.origin.x + Random.Range(-0.05f, 0.05f),
        ray.origin.y + Random.Range(-0.05f, 0.05f), ray.origin.z), Camera.main.transform.forward, out hit))
        {
            InstanceEffects();

            if (hit.transform.tag == "objLift")
            {
                Vector3 dirBullet = ray.direction;
                if (hit.rigidbody != null)
                {
                    hit.rigidbody.AddForceAtPosition(dirBullet * 500, hit.point);

                }
            }
        }

        yield return new WaitForSeconds(0.3f);
        isShooting = false;
    }

    void InstanceEffects()
    {
        Instantiate(spark, hit.point, Quaternion.FromToRotation(Vector3.up, hit.normal));
        Instantiate(smoke, hit.point, Quaternion.FromToRotation(Vector3.up, hit.normal));

        GameObject holeObje = Instantiate(hole, hit.point, Quaternion.FromToRotation(Vector3.up, hit.normal));
        holeObje.transform.parent = hit.transform;
    }
}
