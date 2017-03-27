process Daily_Drink {
  iteration dailydrink {
    action Take_Drink {
      requires { shopping.product == "whiskey" } 
      provides { therapy.relax_muscle } 
      script{ "Whiskey (alcohol), to be enjoyed in the evening"} 
    }
  }
}
