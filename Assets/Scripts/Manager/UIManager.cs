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
        public Sprite[] sprite;



        void Start()
        {
            scriptMove = GameObject.FindWithTag("Player").GetComponent<CharMovement>();
        }


        void Update()
        {
            sliderHP.value = scriptMove.hp;
            sliderHistamina.value = scriptMove.stamina;
        }
    }
}