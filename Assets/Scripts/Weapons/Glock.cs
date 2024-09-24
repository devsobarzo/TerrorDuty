using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BASA;

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
    public AudioClip[] gunsSounds;

    public int magazine = 3;
    public int bullets = 17;
    UIManager uiScript;

    public GameObject posUI;

    public bool automatic;


    void Start()
    {
        automatic = false;
        isShooting = false;
        anim = GetComponent<Animator>();
        audioGun = GetComponent<AudioSource>();
        uiScript = GameObject.FindWithTag("uiManager").GetComponent<UIManager>();
    }


    void Update()
    {
        uiScript.bullets.transform.position = Camera.main.WorldToScreenPoint(posUI.transform.position);
        uiScript.bullets.text = bullets.ToString() + "/" + magazine.ToString();

        if (anim.GetBool("actions"))
        {
            return;
        }

        if (Input.GetKeyDown(KeyCode.Q))
        {
            audioGun.clip = gunsSounds[2];
            audioGun.Play();
            automatic = !automatic;

            if (automatic)
            {
                uiScript.kindShoot.sprite = uiScript.spriteKindShoot[1];
            }
            else
            {
                uiScript.kindShoot.sprite = uiScript.spriteKindShoot[0];
            }
        }

        if (Input.GetButtonDown("Fire3") || automatic ? Input.GetButton("Fire3") : false)
        {
            if (!isShooting && bullets > 0)
            {
                bullets--;
                audioGun.clip = gunsSounds[0];
                audioGun.Play();
                bulletWay.Play();
                isShooting = true;
                StartCoroutine(Shooting());
            }
            else if (!isShooting && bullets == 0 && magazine > 0)
            {
                anim.Play("Recharge");
                magazine--;
                bullets = 17;
            }
            else if (bullets == 0 && magazine == 0)
            {
                audioGun.clip = gunsSounds[3];
                audioGun.Play();
            }
        }
        if (Input.GetKeyDown(KeyCode.R) && magazine > 0 && bullets < 17)
        {
            anim.Play("Recharge");
            magazine--;
            bullets = 17;
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

    void MagazineSounds()
    {
        audioGun.clip = gunsSounds[1];
        audioGun.Play();
    }
    void SoundUp()
    {
        audioGun.clip = gunsSounds[2];
        audioGun.Play();
    }
}
