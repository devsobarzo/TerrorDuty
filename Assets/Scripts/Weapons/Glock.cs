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
    public GameObject particleBlood;
    public ParticleSystem bulletWay;
    public AudioSource audioGun;
    public AudioClip[] gunsSounds;

    public int magazine = 3;
    public int bullets = 17;
    UIManager uiScript;

    public GameObject posUI;
    WeaponMovement weaponMoveScript;
    public bool automatic;

    public float randomNumScope;
    public float scopeValue;


    void Start()
    {
        automatic = false;
        isShooting = false;
        anim = GetComponent<Animator>();
        audioGun = GetComponent<AudioSource>();
        uiScript = GameObject.FindWithTag("uiManager").GetComponent<UIManager>();
        weaponMoveScript = GetComponentInParent<WeaponMovement>();
        scopeValue = 300;
    }


    void Update()
    {
        uiScript.bullets.transform.position = Camera.main.WorldToScreenPoint(posUI.transform.position);
        uiScript.bullets.text = bullets.ToString() + "/" + magazine.ToString();

        ChangeScope();

        if (anim.GetBool("actions"))
        {
            return;
        }
        Automatic();
        Shoot();
        Reload();
        Scope();
    }

    void ChangeScope()
    {
        if (isShooting)
        {
            scopeValue = Mathf.Lerp(scopeValue, 450, Time.deltaTime * 20);
            uiScript.scope.sizeDelta = new Vector2(scopeValue, scopeValue);
        }
        else
        {
            scopeValue = Mathf.Lerp(scopeValue, 300, Time.deltaTime * 20);
            uiScript.scope.sizeDelta = new Vector2(scopeValue, scopeValue);
        }
    }
    void Automatic()
    {
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
    }

    void Shoot()
    {
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
    }

    void Reload()
    {
        if (Input.GetKeyDown(KeyCode.R) && magazine > 0 && bullets < 17)
        {
            anim.Play("Recharge");
            magazine--;
            bullets = 17;
        }
    }

    void Scope()
    {
        if (Input.GetButton("Fire2"))
        {
            anim.SetBool("point", true);
            posUI.transform.localPosition = new Vector3(0, 0.08f, 0);
            Camera.main.fieldOfView = Mathf.Lerp(Camera.main.fieldOfView, 45, Time.deltaTime * 10);
            uiScript.scope.gameObject.SetActive(false);
            weaponMoveScript.value = 0.01f;
            randomNumScope = 0f;
        }
        else
        {
            anim.SetBool("point", false);
            posUI.transform.localPosition = new Vector3(0.16f, 0.02f, 0);
            Camera.main.fieldOfView = Mathf.Lerp(Camera.main.fieldOfView, 60, Time.deltaTime * 10);
            uiScript.scope.gameObject.SetActive(true);
            weaponMoveScript.value = 0.1f;
            randomNumScope = 0.05f;
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

        if (Physics.Raycast(new Vector3(ray.origin.x + Random.Range(-randomNumScope, randomNumScope),
        ray.origin.y + Random.Range(-randomNumScope, randomNumScope),
        ray.origin.z), Camera.main.transform.forward, out hit))
        {
            if (hit.transform.tag == "enemy")
            {
                if (hit.transform.GetComponent<EnemyZombie>())
                {
                    hit.transform.GetComponent<EnemyZombie>().TookDamage(15);
                }

                GameObject particleCreate = Instantiate(particleBlood, hit.point, Quaternion.FromToRotation(Vector3.up, hit.normal));
                particleCreate.transform.parent = hit.transform;
            }
            else
            {
                InstanceEffects();
                if (hit.rigidbody != null)
                {
                    AddForce(ray, 400);
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

    void AddForce(Ray ray, float force)
    {
        Vector3 directionBullet = ray.direction;
        hit.rigidbody.AddForceAtPosition(directionBullet * force, hit.point);
    }
}
