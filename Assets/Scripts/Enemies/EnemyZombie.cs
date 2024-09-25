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


    void Start()
    {
        navMesh = GetComponent<NavMeshAgent>();
        player = GameObject.FindWithTag("Player");
        anim = GetComponent<Animator>();
    }


    void Update()
    {
        playerDistance = Vector3.Distance(transform.position, player.transform.position);
        LookingAtPlayer();
    }

    void LookingAtPlayer()
    {
        navMesh.speed = velocity;
        if (playerDistance < attackDistance)
        {
            navMesh.isStopped = true;
            Debug.Log("attacked");
        }
        else
        {
            navMesh.isStopped = false;
            navMesh.SetDestination(player.transform.position);
        }
    }
}
