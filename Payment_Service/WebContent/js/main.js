$(document).ready(function()
{
    $("#alertSuccess").hide();
    $("#alertError").hide();
    if ($("#info").val() == ""){
        $("#info").hide();
    }
    else {
        $("#info").show();
    }

});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
    if ($('#btnSave').value == 'Update'){
        updatePayment();
    }
    else {
        // Clear status msges-------------
        $("#alertSuccess").text("");
        $("#alertSuccess").hide();
        $("#alertError").text("");
        $("#alertError").hide();
// Form validation----------------
        var status = validateItemForm();
// If not valid-------------------
        if (status != true)
        {
            $("#alertError").text(status);
            $("#alertError").show();
            return;
        }
// If valid----------------------
        $('#paymentFormModal').modal('hide');

        $("#formStudent")[0].reset();

    }
});

$(document).on("click", ".update", function(event){
    var id = $(this).closest('tr').find('.id').text();
    updatePayment(id);
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


function updatePayment(id) {

    $('#paymentFormModal').modal('toggle');
    $('#btnSave').attr('value', 'Update');
    $('#formPayment').attr('action', 'update?id='+id);
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

