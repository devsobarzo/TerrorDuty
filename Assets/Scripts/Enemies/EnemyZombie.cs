using System.Collections;
using System.Collections.Generic;
using BASA;
using UnityEngine;
using UnityEngine.AI;

public class EnemyZombie : MonoBehaviour
{

    public NavMeshAgent navMesh;
    public GameObject player;
    public float attackDistance;
    public float playerDistance;
    public float velocity = 5;
    public Animator anim;
    public int hp = 100;
    public bool isDead;
    public bool angry;
    public Renderer render;
    public bool invincible;
    Ragdoll ragScript;
    public GameObject objSlide;
    public AudioClip[] sounds;
    public AudioSource soundEnemy;

    void Start()
    {
        navMesh = GetComponent<NavMeshAgent>();
        player = GameObject.FindWithTag("Player");
        anim = GetComponent<Animator>();
        ragScript = GetComponent<Ragdoll>();
        render = GetComponentInChildren<Renderer>();
        soundEnemy = GetComponent<AudioSource>();
        invincible = false;
        isDead = false;
        ragScript.RagdollDisabled();
    }


    void Update()
    {
        if (!isDead)
        {
            playerDistance = Vector3.Distance(transform.position, player.transform.position);

            LookingAtPlayer();
            LookAtPlayer();

            if (hp <= 20 && !angry)
            {
                angry = true;
                anim.ResetTrigger("recieveShoot");
                StopMove();
                anim.CrossFade("Scream", 0.2f);
                render.material.color = Color.red;
                velocity = 8;
            }


            if (hp <= 0 && !isDead)
            {
                DiedSound();
                render.material.color = Color.white;
                objSlide.SetActive(false);
                isDead = true;
                StopMove();
                navMesh.enabled = true;
                ragScript.RagdollEnabled();
            }
        }
    }

    void LookAtPlayer()
    {
        Vector3 directionView = player.transform.position - transform.position;
        Quaternion rotation = Quaternion.LookRotation(directionView);
        transform.rotation = Quaternion.RotateTowards(transform.rotation, rotation, Time.deltaTime * 300);
    }

    void LookingAtPlayer()
    {
        navMesh.speed = velocity;
        if (playerDistance < attackDistance)
        {
            navMesh.isStopped = true;
            Debug.Log("attacked");
            anim.SetTrigger("attack");
            anim.SetBool("canMove", false);
            anim.SetBool("stopAttack", false);
            CheckRigidIn();
        }

        if (playerDistance >= 3)
        {
            anim.SetBool("stopAttack", true);
        }
        if (anim.GetBool("canMove"))
        {
            navMesh.isStopped = false;
            navMesh.SetDestination(player.transform.position);
            anim.ResetTrigger("attack");
            CheckRigidOut();
        }
    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.CompareTag("Player"))
        {
            CheckRigidIn();
        }
    }
    void OnCollisionExit(Collision col)
    {
        if (col.gameObject.CompareTag("Player"))
        {
            CheckRigidOut();
        }
    }

    void CheckRigidIn()
    {
        ragScript.rigid.isKinematic = true;
        ragScript.rigid.velocity = Vector3.zero;
    }

    void CheckRigidOut()
    {
        ragScript.rigid.isKinematic = false;
    }

    public void TookDamage(int damage)
    {
        int n;
        n = Random.Range(0, 10);

        if (n % 2 == 0 && !angry)
        {
            anim.SetTrigger("recieveShoot");
            StopMove();
        }
        if (!invincible)
        {
            hp -= damage;
        }
    }

    public void StopMove()
    {
        navMesh.isStopped = true;
        anim.SetBool("canMove", false);
        CheckRigidIn();
    }

    public void PlayerDamage()
    {
        player.GetComponent<CharMovement>().hp -= 5;
    }

    public void BeInvincible()
    {
        invincible = true;
    }

    public void NotInvincible()
    {
        invincible = false;
        anim.speed = 2;
    }

    public void StepSounds()
    {
        soundEnemy.volume = 0.05f;
        soundEnemy.PlayOneShot(sounds[0]);
    }

    public void PainSound()
    {
        soundEnemy.volume = 1f;
        soundEnemy.clip = sounds[1];
        soundEnemy.Play();
    }

    public void ScreamSound()
    {
        soundEnemy.clip = sounds[2];
        soundEnemy.Play();
    }
    public void DiedSound()
    {
        soundEnemy.clip = sounds[3];
        soundEnemy.Play();
    }


}
