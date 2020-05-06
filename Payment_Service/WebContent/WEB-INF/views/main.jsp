<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Tax</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.5.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/main.js"></script>
</head>
<body>
<div id="info" class="alert alert-success">${it.msg}</div>
<div align="center">
    <a type="button" class="btn btn-primary btn-lg btn-block" href="get">List All Tax Entries</a>
    <a type="button" class="btn btn-secondary btn-lg btn-block" data-toggle="modal" data-target="#paymentFormModal">Add New Tax Entry</a>
</div>

<!-- Modal add -->
<div class="modal fade bd-example-modal-lg" id="paymentFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add Tax Entry</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <form class="needs-validation" id="formTax" name="formTax" method="post" action="add" novalidate>

                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblAmount">Amount : </span>
                                </div>
                                <input type="text" id="amount" name="amount">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblValidFrom">Valid from Date: </span>
                                </div>
                                <input type="text" id="validFrom" name="validFrom">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblValidTo">Valid to Date: </span>
                                </div>
                                <input type="text" id="validTo" name="validTo">
                            </div>

                            <input type="submit" id="btnSave" value="Submit" class="btn btn-primary">

                            <div id="alertSuccess" class="alert alert-success"></div>
                            <div id="alertError" class="alert alert-danger"></div>

                        </form>
                    </div>
                </div>


                    <br>

                    <div class="row">
                        <div class="col-12" id="colStudents">

                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>

</body>
</html>
