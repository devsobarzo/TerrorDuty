using System.Collections;
using System.Collections.Generic;
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

    Ragdoll ragScript;

    public GameObject objSlide;

    void Start()
    {
        navMesh = GetComponent<NavMeshAgent>();
        player = GameObject.FindWithTag("Player");
        anim = GetComponent<Animator>();
        ragScript = GetComponent<Ragdoll>();
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

            if (hp <= 0 && !isDead)
            {
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
        StopMove();
        hp -= damage;
    }

    public void StopMove()
    {
        navMesh.isStopped = true;
        anim.SetTrigger("recieveShoot");
        anim.SetBool("canMove", false);
        CheckRigidIn();
    }
}
