fluidPage(
  ## Title panel
  titlePanel(
    title = 'Analyse projet immobilier'
    ),
  fluidRow(
    
    column(
      width = 4,
      numericInput('p_epargne', label='Epargne (k€)', value=10),
      numericInput('p_achat', label = 'Vente (k€)', value=100),
      numericInput('p_taxefonc', label = 'Taxe foncière (€/an)', value=1200),
      numericInput('p_copro', label = 'Charge de copropriété (€/an)', value=1200),
      numericInput('p_loyestm', label='Loyer estimé (€/mois)', value=600),
      numericInput(inputId = 'taux_pret', label = 'Taux accordé (%)', value = 2.5),
      sliderInput(
        inputId = 'nb_annpret',
        min = 0, max = 25, step = 1, value = 10, label = 'Durée du crédit (années)'
      ),
      textOutput(outputId = 'renta_achat'),
      textOutput(outputId = 'renta_epargne'),
      textOutput(outputId='f_cc'),
      textOutput(outputId = 'f_capit')
      ),
    column(
      width=8,
      plotOutput(outputId = 'annu')
    )
  )
)