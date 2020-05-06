<%--
  Created by IntelliJ IDEA.
  User: sadini
  Date: 4/25/2020
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Payments</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.5.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/main.js"></script>
</head>
<body>
<div id="info" class="alert alert-success">${it.msg}</div>
<div align="center">
    <a type="button" class="btn btn-primary btn-lg btn-block" href="get">List All Payment</a>
    <a type="button" class="btn btn-secondary btn-lg btn-block" data-toggle="modal" data-target="#paymentFormModal">Add New Payment</a>
    <a type="button" id="taxRoute" class="btn btn-secondary btn-lg btn-block">Tax</a>

</div>

<!-- Modal add -->
<div class="modal fade bd-example-modal-lg" id="paymentFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <form class="needs-validation" id="formPayment" name="formPayment" method="post" action="add" novalidate>

                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblCardType">Card Type: </span>
                                </div>
                                <input type="text" id="cardType" name="cardType">
                                <div class="invalid-feedback">
                                    Please provide a valid card type.
                                </div>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblCardNumber">Card Number: </span>
                                </div>
                                <input type="text" id="cardNumber" name="cardNumber">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblNameOnCard">Name On Card: </span>
                                </div>
                                <input type="text" id="nameOnCard" name="nameOnCard">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblCvc">CVC: </span>
                                </div>
                                <input type="text" id="cvc" name="cvc">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblExpDate">Card Expire Date: </span>
                                </div>
                                <input type="text" id="expireDate" name="expireDate">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblStatus">Status: </span>
                                </div>
                                <input type="text" id="status" name="status">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblPayDate">Payment Date: </span>
                                </div>
                                <input type="text" id="paymentDate" name="paymentDate">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblappId">Appointment Id: </span>
                                </div>
                                <input type="text" id="appointmentId" name="appointmentId">
                            </div>

                            <input type="submit" id="btnSave" value="Submit" class="btn btn-primary">

                            <div id="alertSuccess" class="alert alert-success"></div>
                            <div id="alertError" class="alert alert-danger"></div>

                        </form>

                        <form class="needs-validation" id="formUpdatePayment" name="formUpdatePayment"novalidate>

                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblCardTypeUpdate">Card Type: </span>
                                </div>
                                <input type="text" id="cardTypeUpdate" name="cardType">
                                <div class="invalid-feedback">
                                    Please provide a valid card type.
                                </div>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblCardNumberUpdate">Card Number: </span>
                                </div>
                                <input type="text" id="cardNumberUpdate" name="cardNumber">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblNameOnCardUpdate">Name On Card: </span>
                                </div>
                                <input type="text" id="nameOnCardUpdate" name="nameOnCard">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblCvcUpdate">CVC: </span>
                                </div>
                                <input type="text" id="cvcUpdate" name="cvc">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblExpDateUpdate">Card Expire Date: </span>
                                </div>
                                <input type="text" id="expireDateUpdate" name="expireDate">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblStatusUpdate">Status: </span>
                                </div>
                                <input type="text" id="statusUpdate" name="status">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblPayDateUpdate">Payment Date: </span>
                                </div>
                                <input type="text" id="paymentDateUpdate" name="paymentDate">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="lblappIdUpdate">Appointment Id: </span>
                                </div>
                                <input type="text" id="appointmentIdUpdate" name="appointmentId">
                            </div>

                            <input type="button" id="btnUpdate" value="Update" class="btn btn-primary">

                            <div id="alertSuccessUpdate" class="alert alert-success"></div>
                            <div id="alertErrorUpdate" class="alert alert-danger"></div>

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
