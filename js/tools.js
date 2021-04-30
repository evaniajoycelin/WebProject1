function validateFormTesti() {
    var isEmailValid = false;
    var isTestiValid = false;
    
    isEmailValid = validateEmail();
    isTestiValid = validateTesti();

    $('#testi-submit-btn').prop('disabled', !(isEmailValid && isTestiValid));

}

function validateEmail() {
    var email = $('#inputEmail').val();
    var emailPattern = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (email == "") {
        $("#errEmail").css("display", "block");
        $("#errEmail").html("*Please input your email.");
        return false;
    } else if (emailPattern.test(email) == false) {
        $('#errEmail').css("display", "block");
        $('#errEmail').html("*Wrong email.");
        return false;
    } else {
        $('#errEmail').css("display", "none");
        return true;
    }
}

function validateTesti() {
    var testi = $('#inputTestimoni').val();

    if (testi == "") {
        $("#errTestimoni").css("display", "block");
        $("#errTestimoni").html("*Please input your testimoni.");
        return false;
    } else {
        $('#errTestimoni').css("display", "none");
        return true;
    }
}

$('#testi-submit-btn').prop('disabled', true);
$('#errEmail').css("display", "none");
$('#errTestimoni').css("display", "none");

$('#inputEmail').on('keyup', function(e) {
    validateFormTesti();
});

$('#inputTestimoni').on('keyup', function(e) {
    validateFormTesti();
});

$('#money-submit-btn').on('click', function(e){
    var input = $('#inputMoney').val();
    var total = $('#total-price').text();
    var change = input - total;

    if (input == "") {
        $("#errMoney").css("display", "inline-block");
        $("#errMoney").html("*Please pay first.");
    } else if(change < 0){
        $("#errMoney").css("display", "inline-block");
        $("#errMoney").html("*Not enough money.");
    }else {
        
        $('#errMoney').css("display", "none");
        $("#change").html("Your change is "+ change);
    }

});

function validate_form(){
    valid = true;
    
    if($('input[type=checkbox]:checked').length == 0)
    {
        alert("ERROR! Please select at least one food" );
        valid = false;
        return valid;
    }else{
        for(var i = 0 ; i<12; i++){
            var getCheck = "input[name=checkbox-"+i+"]";
            var getQty = "input[name=food-qty-"+i+"]";
            var getName = "input[name=food-name-"+i+"]";

            if($(getCheck).prop('checked') == true){
                if($(getQty).val() == ""){
                    alert("ERROR! Please select " + $(getName).val() + " quantity");
                    valid = false;
                    return valid;
                }
            } 
        }
    }
    return valid;
    
}

$("#menu-submit-btn").on('click', function(e){
    if(validate_form() == false){
        e.preventDefault();
    }else{
        validate_form();
    }
    
});



