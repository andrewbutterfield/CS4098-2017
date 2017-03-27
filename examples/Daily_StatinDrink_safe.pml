process Daily_StatinDrink_safe {
  iteration dailystatin{
    action Take_Statin {
      requires { prescription.drug == "statin" }
      provides { therapy.drug == "statin" }
      script{ "Statin to be taken daily, in the morning"}
    }
    action waitUntilSafe {
      script {" wait for (at least) 6 hours "}
    }
    action Take_Drink {
      requires { shopping.product == "whiskey" } 
      provides { therapy.relax_muscle } 
      script{ "Whiskey (alcohol), to be enjoyed in the evening"} 
    }    
  }
}
