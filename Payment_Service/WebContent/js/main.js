$(document).ready(function()
{
    $("#alertSuccess").hide();
    $("#alertError").hide();
    $("#alertSuccessUpdate").hide();
    $("#alertErrorUpdate").hide();
    if ($("#info").val() == ""){
        $("#info").hide();
    }
    else {
        $("#info").show();
    }

});
function clearMessages(){
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();
}
let id;

// SAVE ============================================
$("#formPayment").on("submit", function(){
    var status = validateItemForm();
    if (status == true){
        $("#alertSuccess").text('payment added successfully');
        $("#alertSuccess").show();
        return;
    }
    else if (status != true){
        $("#alertError").text(status);
        $("#alertError").show();
        return;
    }
});

$("#formTax").on("submit", function(){
    var status = validateTaxForm();
    if (status == true){
        $("#alertSuccess").text('payment added successfully');
        $("#alertSuccess").show();
        return;
    }
    else if (status != true){
        $("#alertError").text(status);
        $("#alertError").show();
        return;
    }
});

$(document).on("click", "#taxRoute", function(event){
    location.assign('http://localhost:8080/Payment_Service_war_exploded/PaymentService/Tax/')
});

$(document).on("click", "#btnUpdate", function(event){
    var status = validateUpdateForm();
    if (status == true){
        var data = JSON.stringify($("#formUpdatePayment").formToJson());
        $.ajax({
            url: 'update?paymentId='+id,
            type: 'PUT',
            data: data,
            success: function() {

            }
        });
        $("#alertSuccessUpdate").text('payment updated successfully');
        $("#alertSuccessUpdate").show();
        return;
    }
    else if (status != true){
        $("#alertErrorUpdate").text(status);
        $("#alertErrorUpdate").show();
        return;
    }

    return true;
});

$(document).on("click", ".update", function(event){
    id = $(this).closest('tr').find('.id').text();
    $('#paymentFormModal').modal('toggle');
    $('#formPayment').hide();

});

let taxId;
$(document).on("click", ".delete", function(event){
    taxId = $(this).closest('tr').find('.id').text();
    $.ajax({
        url: 'delete?id='+taxId,
        type: 'DELETE',
        success: function() {
            console.log('delete success')
            window.location.replace("http://localhost:8080/Payment_Service_war_exploded/PaymentService/Tax/get");
        }
    });
    $("#alertSuccessUpdate").text('payment updated successfully');
    $("#alertSuccessUpdate").show();
    return;
});


// CLIENT-MODEL=================================================================
function validateItemForm()
{
    if ($("#cardType").val().trim() == "")
    {
        return "Insert valid card type";
    }
    if ($("#cardNumber").val().trim() == "")
    {
        return "Insert card number.";
    }
    if ($("#nameOnCard").val().trim() == "")
    {
        return "Insert the name on card.";
    }
    if ($("#cvc").val().trim() == "")
    {
        return "Insert cvc number.";
    }
    if ($("#expireDate").val().trim() == "")
    {
        return "Insert card expire date.";
    }
    if ($("#status").val().trim() == "")
    {
        return "Insert payment status.";
    }
    if ($("#paymentDate").val().trim() == "")
    {
        return "Insert payment date.";
    }
    if ($("#appointmentId").val().trim() == "")
    {
        return "Insert appointment id.";
    }


    return true;
}

function validateUpdateForm()
{
    if ($("#cardTypeUpdate").val().trim() == "")
    {
        return "Insert valid card type";
    }
    if ($("#cardNumberUpdate").val().trim() == "")
    {
        return "Insert card number.";
    }
    if ($("#nameOnCardUpdate").val().trim() == "")
    {
        return "Insert the name on card.";
    }
    if ($("#cvcUpdate").val().trim() == "")
    {
        return "Insert cvc number.";
    }
    if ($("#expireDateUpdate").val().trim() == "")
    {
        return "Insert card expire date.";
    }
    if ($("#statusUpdate").val().trim() == "")
    {
        return "Insert payment status.";
    }
    if ($("#paymentDateUpdate").val().trim() == "")
    {
        return "Insert payment date.";
    }
    if ($("#appointmentIdUpdate").val().trim() == "")
    {
        return "Insert appointment id.";
    }


    return true;
}

function validateTaxForm()
{
    if ($("#amount").val().trim() == "")
    {
        return "Insert Amount";
    }
    if ($("#validFrom").val().trim() == "")
    {
        return "Insert Valid From date";
    }
    if ($("#validTo").val().trim() == "")
    {
        return "Insert Valid To date";
    }

    return true;
}



// https://github.com/HasanQQ/formToJson.git
$.fn.formToJson=function(){form=$(this);var formArray=form.serializeArray(),jsonOutput={};return $.each(formArray,(function(i,element){var elemNameSplit=element.name.split("["),elemObjName="jsonOutput";$.each(elemNameSplit,(function(nameKey,value){nameKey!=elemNameSplit.length-1?(elemObjName="]"==value.slice(value.length-1)?"]"===value?elemObjName+"["+Object.keys(eval(elemObjName)).length+"]":elemObjName+"["+value:elemObjName+"."+value,void 0===eval(elemObjName)&&eval(elemObjName+" = {};")):"]"==value.slice(value.length-1)?"]"===value?eval(elemObjName+"["+Object.keys(eval(elemObjName)).length+"] = '"+element.value.replace("'","\\'")+"';"):eval(elemObjName+"["+value+" = '"+element.value.replace("'","\\'")+"';"):eval(elemObjName+"."+value+" = '"+element.value.replace("'","\\'")+"';")}))})),jsonOutput};