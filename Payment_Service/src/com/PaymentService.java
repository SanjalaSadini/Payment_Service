package com;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.validator.constraints.NotEmpty;

import model.Payment;

@Path("/Payment")
public class PaymentService {
	
	Payment payment = new Payment();

	@GET
	@Path("")
	@Produces(MediaType.TEXT_HTML)
	public Viewable index() {
		return new Viewable("/index");
	}

	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_HTML)
	public Viewable addPayment(@FormParam("cardType") String cardType,
			@FormParam("cardNumber") int cardNumber,
			@FormParam("nameOnCard") String nameOnCard,
			@FormParam("cvc") int cvc,
			@FormParam("expireDate") Date expireDate,
			@FormParam("status") String status,
			@FormParam("paymentDate") Date paymentDate,
			@FormParam("appointmentId") int appointmentId) {
		String msg = this.payment.addPayment(cardType, cardNumber, nameOnCard, cvc, expireDate, status, paymentDate, appointmentId);
		Map<String, String> model = new HashMap<>();
		model.put("msg", msg);
		return new Viewable("/index", model);
	}
	
	
	@GET
	@Path("/getById")
	@Produces(MediaType.TEXT_HTML)
	public String getPaymentById(@QueryParam("patientId") int patientId) {

		return this.payment.getPaymentByPatient(patientId);
	}
	
	
	@GET
    @Path("/get")
    public Viewable getAllPaymentEntry(){
		String output = this.payment.getAllPayment();
		Map<String, String> model = new HashMap<>();
		model.put("output", output);
		return new Viewable("/payment", model);
    }
	
	
	/*@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_HTML)
	public Viewable updatePaymentById(@QueryParam("paymentId") int id ,
			@FormParam("cardType") String cardType,
			@FormParam("cardNumber") int cardNumber,
			@FormParam("nameOnCard") String nameOnCard,
			@FormParam("cvc") int cvc,
			@FormParam("expireDate") Date expireDate,
			@FormParam("status") String status,
			@FormParam("paymentDate") Date paymentDate,
			@FormParam("appointmentId") int appointmentId ) {

		String msg = this.payment.updatePayment(id,cardType,cardNumber,nameOnCard,cvc,expireDate,status,paymentDate,appointmentId);
		Map<String, String> model = new HashMap<>();
		model.put("msg", msg);
		return new Viewable("/index", model);
	}*/

	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_HTML)
	public Viewable updatePaymentById(@QueryParam("paymentId") int id , String paymentData) {

		JsonObject paymentObject = new JsonParser().parse(paymentData).getAsJsonObject();
		 String cardType = paymentObject.get("cardType").getAsString();
		 int cardNumber = paymentObject.get("cardNumber").getAsInt();
		 String nameOnCard = paymentObject.get("nameOnCard").getAsString();
		 int cvc = paymentObject.get("cvc").getAsInt();
		 String expireDate = paymentObject.get("expireDate").getAsString();
		 String status =  paymentObject.get("cardType").getAsString();
		String paymentDate = paymentObject.get("paymentDate").getAsString();;
		 int appointmentId = paymentObject.get("appointmentId").getAsInt();

		 Date cnvExpireDate = Date.valueOf(expireDate);
		 Date cnvPaymentDate = Date.valueOf(paymentDate);

		String msg = this.payment.updatePayment(id,cardType,cardNumber,nameOnCard,cvc,cnvExpireDate,status,cnvPaymentDate,appointmentId);
		Map<String, String> model = new HashMap<>();
		model.put("msg", msg);
		return new Viewable("/index", model);
	}

}


