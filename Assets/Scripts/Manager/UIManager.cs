using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace BASA
{

    public class UIManager : MonoBehaviour
    {

        public Slider sliderHP, sliderHistamina;
        public CharMovement scriptMove;
        public TextMeshProUGUI bullets;
        public Image kindShoot;
        public Sprite[] spriteKindShoot;



        void Start()
        {
            scriptMove = GameObject.FindWithTag("Player").GetComponent<CharMovement>();
            bullets.enabled = true;
            kindShoot.enabled = true;
        }


        void Update()
        {
            sliderHP.value = scriptMove.hp;
            sliderHistamina.value = scriptMove.stamina;
        }
    }
}