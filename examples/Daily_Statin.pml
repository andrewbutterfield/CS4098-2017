process Daily_Statin {
  iteration dailystatin{
    action Take_Statin {
      requires { prescription.drug == "statin" }
      provides { therapy.drug == "statin" }
      script{ "Statin to be taken daily, in the evening"}
    }
  }
}
