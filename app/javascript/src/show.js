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

setservicos = function(equipe_selected, servicos) {
  var hashservicos = servicos;
  $("#servicos_select").empty();
  console.log(hashservicos[equipe_selected]);
  if (typeof hashservicos[equipe_selected] !== "undefined") {
    for (let i = 0; i < hashservicos[equipe_selected].length; i++) {
      $("#servicos_select").append( $("<option>")
        .val(hashservicos[equipe_selected][i].id)
        .html(hashservicos[equipe_selected][i].nome)
      );
    }
  }
}

setequipes = function(departamento, equipes, servicos) {
  var hashequipes = equipes;
  $("#servicos_select").empty();
  $("#equipes_select").empty();

  if (typeof hashequipes[departamento.value] !== "undefined") {
    for (let i = 0; i < hashequipes[departamento.value].length; i++) {
      $("#equipes_select").append( $("<option>")
        .val(hashequipes[departamento.value][i].id)
        .html(hashequipes[departamento.value][i].nome)
      );
    }
  }

  if (typeof hashequipes[departamento.value] !== "undefined") {
    setservicos(hashequipes[departamento.value][0].id, servicos)
  }
}

openmodal = function() {
  window.$('#exampleModal').modal('show');
}
