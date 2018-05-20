function(input, output){
  output$renta_achat <- renderText({
      return(paste0('Rentabilité sur achat: ', round(0.1*(input$p_loyestm*12-input$p_taxefonc-input$p_copro)/input$p_achat,2), '%/an'))
  })
  output$renta_epargne <- renderText({
    return(paste0("Rentabilité sur épargne: ", round(0.1*(input$p_loyestm*12-input$p_taxefonc-input$p_copro)/input$p_epargne,2), '%/an'))
  })
  output$f_cc <- renderText({
    return(paste0("Flux compte courant : ", round(input$p_loyestm-(input$p_taxefonc+input$p_copro)/12-(0.01*input$taux_pret+1/input$nb_annpret)*1000*(input$p_achat-input$p_epargne)/12,2), '€/mois'))
  })
  output$f_capit <- renderText({
    return(paste0("Capital gagné : ", round((input$p_achat-input$p_epargne)*1000/12/input$nb_annpret,2), '€/mois'))
  })
  output$annu <- renderPlot({
    annu.plot(
      E=1000*(as.numeric(input$p_achat)-as.numeric(input$p_epargne)),
      nA=input$nb_annpret,
      tx=0.01*input$taux_pret,
      R=input$p_loyestm*12,
      copro=input$p_copro,
      tfonc=input$p_taxefonc
    )
  })
}