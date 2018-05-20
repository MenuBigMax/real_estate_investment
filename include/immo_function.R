annu.calc <- function(E,nA, tx, copro=NULL, tfonc=NULL){
  out <- data.frame(
    An=1:nA,
    Remboursement=E/nA,
    ResteDu=seq(E, E/nA, length.out = nA)
  )
  out <- cbind(out,Intérêt=out$ResteDu*tx)
  if(!is.null(copro)) out <- cbind(out, Copropriété=copro)
  if(!is.null(tfonc)) out <- cbind(out, Foncier=tfonc)
  return(round(out,2))
}

annu.plot <- function(E, nA, tx, R=NULL, copro=NULL, tfonc=NULL){
  annu <- melt(
    data = annu.calc(E=E, nA=nA, tx=tx, copro=copro, tfonc=tfonc)[,-3],
    id.vars='An')
  colnames(annu)[2:3] <- c('Affectation', 'Montant')
  p <- ggplot()+geom_bar(aes(x=An, y=Montant, fill=Affectation), data=annu, stat='identity')
  #p <- p+geom_text(data=annu, aes(x=An, y=Montant, label=paste0(Montant, ' €')), size=4)
  if(!is.null(R)) p <- p+geom_line(y=R)
  p <- p+theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank())
  p
}

#E=10^5;nA=10;tx=0.025;R=10^4;copro=1200;tfonc=1200
#annu.calc(E,nA,tx)
#annu.plot(E,nA,tx,R)
