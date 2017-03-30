process ConstructDDITest {

    selection SEL1 {

        sequence SEQ1 {
            action a { script{"drug1"}}
            sequence SEQ2 {
                action b {script{"drug2"}}
                action c {script{"drug3"}}
            }
            action d { script{"drug4"}}
        }

        iteration ITER {
            branch PAR {

                sequence SEQ3 {
                    action e {script{"drug1"}}
                    selection SEL2 {
                        action f {script{"drug2"}}
                        action g {script{"drug3"}}
                    }
                }

                sequence SEQ4 {
                    action h {script{"drug2"}}
                    action j {script{"drug4"}}
                }

            }
        }

    }

}
