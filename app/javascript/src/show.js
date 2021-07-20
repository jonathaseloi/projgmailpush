setcontent = function(acao) {
  if (acao.value == "NÃO PROCEDE") {
    $('#nao-procede').removeClass("hide")
    $('#procede').addClass("hide")
  } else if(acao.value == "PROCEDE") {
    $('#procede').removeClass("hide")
    $('#nao-procede').addClass("hide")
  } else {
    $('#nao-procede').addClass("hide")
    $('#procede').addClass("hide")
  }
}