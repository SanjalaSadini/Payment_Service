package com;

import model.Tax;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Path("/Tax")
public class TaxService {

    Tax tax = new Tax();

    @GET
    @Path("")
    @Produces(MediaType.TEXT_HTML)
    public Viewable index() {
        return new Viewable("/main");
    }

    @POST
    @Path("/add")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_HTML)
    public Viewable addTaxEntry(@FormParam("amount")float amount,
                                @FormParam("validFrom") Date validFrom,
                                @FormParam("validTo") Date validTo){
        String msg = this.tax.addTaxEntry(amount, validFrom, validTo );
        Map<String, String> model = new HashMap<>();
        model.put("msg", msg);
        return new Viewable("/main", model);
    }

    @GET
    @Path("/get")
//    @Produces(MediaType.TEXT_HTML)
    public Viewable getAllTaxEntry(){
        String output = this.tax.getAllTaxEntry();
        Map<String, String> model = new HashMap<>();
        model.put("output", output);
        return new Viewable("/tax", model);
    }

    @GET
    @Path("/getById")
//    @Produces(MediaType.TEXT_HTML)
    public String getTaxEntryById(@QueryParam("id") int id){
        return this.tax.getTaxEntryById(id);
    }

    @PUT
    @Path("/update")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String updateTaxEntryById(@QueryParam("id") int id,
                                     @FormParam("amount") float amount,
                                     @FormParam("validFrom") Date validFrom,
                                     @FormParam("validTo") Date validTo){

        return this.tax.updateTaxEntryById(id, amount, validFrom, validTo );
    }

    @DELETE
    @Path("/delete")
    @Produces(MediaType.TEXT_PLAIN)
    public String deleteTaxEntryById(@QueryParam("id") int id){
        return this.tax.deleteTaxEntryById(id);
    }

}
