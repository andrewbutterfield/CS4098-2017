process Daily_StatinDrink_merge {
  sequence Daily_Statin {
    iteration dailystatin {
      action Take_Statin {
        requires { prescription.drug == "statin" }
        provides { therapy.drug == "statin" }
        script{ "Statin to be taken daily, in the evening"}
      }
    }
  }
  sequence Daily_Drink {
    iteration dailydrink {
      action Take_Drink {
        requires { shopping.product == "whiskey" } 
        provides { therapy.relax_muscle } 
        script{ "Whiskey (alcohol), to be enjoyed in the evening"} 
      }
    }
  }
}
