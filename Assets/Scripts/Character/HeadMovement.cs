using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BASA;

public class HeadMovement : MonoBehaviour
{
    private float time = 0.0f;
    public float speed = 0.05f;
    public float force = 0.1f;
    public float origenPoint = 0.0f;

    float cutWave;
    float horizontal;
    float vertical;
    Vector3 savePosition;

    AudioSource audioSource;
    public AudioClip[] audioClip;
    public int indexSteps;

    CharMovement scriptMove;

    void Start()
    {
        scriptMove = GetComponentInParent<CharMovement>();
        audioSource = GetComponent<AudioSource>();
        indexSteps = 0;
    }

    void Update()
    {
        cutWave = 0.0f;
        horizontal = Input.GetAxis("Horizontal");
        vertical = Input.GetAxis("Vertical");

        savePosition = transform.localPosition;

        if (Mathf.Abs(horizontal) == 0 && Mathf.Abs(vertical) == 0)
        {
            time = 0.0f;
        }
        else
        {
            cutWave = Mathf.Sin(time);
            time = time + speed;

            if (time > Mathf.PI * 2)
            {
                time = time - (Mathf.PI * 2);
            }
        }

        if (cutWave != 0)
        {
            float changeMovement = cutWave * force;
            float axisTotals = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
            axisTotals = Mathf.Clamp(axisTotals, 0.0f, 1.0f);
            changeMovement = axisTotals * changeMovement;
            savePosition.y = origenPoint + changeMovement;
        }
        else
        {
            savePosition.y = origenPoint;
        }

        transform.localPosition = savePosition;

        SoundsSteps();
        UpdateHead();
    }

    void SoundsSteps()
    {
        if (cutWave <= -0.95f && !audioSource.isPlaying && scriptMove.isOnGround)
        {
            audioSource.clip = audioClip[indexSteps];
            audioSource.Play();
            indexSteps++;
            if (indexSteps >= 4)
            {
                indexSteps = 0;
            }
        }
    }

    void UpdateHead()
    {
        if (scriptMove.isRunning)
        {
            speed = 0.25f;
            force = 0.25f;
        }
        else if (scriptMove.isBend)
        {
            speed = 0.15f;
            force = 0.11f;
        }
        else
        {
            speed = 0.18f;
            force = 0.15f;
        }
    }
}
