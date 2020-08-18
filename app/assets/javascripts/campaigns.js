$(document).on('ready turbolinks:load', function(){
    var campaign_id = $(location).attr('href').split("/").pop();
    var positive_id = 0;


    var allOptions = document.getElementById("all-options").children;
    var voidColor = "rgb(213, 211, 211)";
  
    
    for (let item of allOptions) {
        document.getElementById(item.id).addEventListener('click', function (event) {
            if (item.style.color == voidColor){
                item.removeAttribute("style");
                for (let s of allOptions) {
                    if(s != item){
                        s.style.color = voidColor
                    }
                }
            } else {
                item.style.color = voidColor
            }

            voter_number = document.getElementById('voter_number').innerHTML;
            alert(voter_number);
            
            sendVote(item.id, voter_number);
        });
    }


    function sendVote(vote){
        if(positive_id == 0){
            createVote(vote, voter_number);
        }else{
            updateVote(vote);
        }
        
    }

    function updateVote(vote){
        var data = JSON.stringify({"vote": {"option_id": vote} });
        var settings = {
            "async": true,
            "crossDomain": true,
            "url": window.location.href.split("campaign")[0]+"votes/"+positive_id,
            "method": "PUT",
            "headers": {
                "cache-control": "no-cache",
                "Content-Type": "application/json"
            },
            "processData": false,
            "data": data
        }
  
        $.ajax(settings).done(function (response) {
            if(response.option_id == vote){
                positive_id = response.id
                alert("Voto atualizado com sucesso!");
            }else{
                alert("Algo deu errado, não foi possivel atualizar!");
            }
        }).fail( function (){
            alert("Algo deu errado, não foi possivel votar!!");
        });     
    }
  

  
    function createVote(vote, voter_number){
        var data = JSON.stringify({"vote": {"option_id": vote,"campaign_id": parseInt(campaign_id), "voter": voter_number } });
        var settings = {
            "async": true,
            "crossDomain": true,
            "url": window.location.href.split("campaign")[0]+"votes",
            "method": "POST",
            "headers": {
                "cache-control": "no-cache",
                "Content-Type": "application/json"
            },
            "processData": false,
            "data": data
        }

        $.ajax(settings).done(function (response) {
            if(response.option_id == vote){
                positive_id = response.id
                alert("O voto feito com sucesso");
            }else{
                alert("Algo deu errado, não foi possivel votar!!");
            }
        })
        .fail( function (){
            alert("Algo deu errado, não foi possivel votar!!");
        });    
    }
  
  });