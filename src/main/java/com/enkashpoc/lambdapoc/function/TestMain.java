package com.enkashpoc.lambdapoc.function;

import com.enkashpoc.lambdapoc.model.APIRequest;
import com.enkashpoc.lambdapoc.utils.AWSS3Helper;
import com.enkashpoc.lambdapoc.utils.FreemarkerHelper;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.util.*;

public class TestMain
{
    @Autowired
    AWSS3Helper awsS3Helper;

    public static void main(String[] args) {
        try
        {
            HashMap <String, Object> params = new HashMap();

            params.put("username", "Uday Kumar");
            params.put("period","4 Years");
            params.put("last4","4188");
            params.put("outstandingAmount","500");
            params.put("minDue","100");
            params.put("dueDate","12/09/2020");
            params.put("paymentLink","www.socialangels.co.in");
            params.put("cardAccountId","4401");
            params.put("processingFee","50");

            APIRequest apiRequest = new APIRequest();
            apiRequest.setParams(params);
            apiRequest.setTemplateName("CardStatementGenerated");

            String htmlString =  new FreemarkerHelper().getTemplateString(apiRequest);

            ByteArrayOutputStream oOut = new ByteArrayOutputStream();

/*            PdfWriter writer = new PdfWriter("C:\\Users\\Uday\\Desktop\\lambdaPOC\\test.pdf");

            HtmlConverter.convertToPdf(htmlString, writer);

            writer.close();*/

            /*Pdfcrowd.HtmlToPdfClient client =
                    new Pdfcrowd.HtmlToPdfClient("demo", "ce544b6ea52a5621fb9d55f8b542d14d");

            client.convertStringToFile(htmlString, "C:\\Users\\Uday\\Desktop\\lambdaPOC\\test.pdf");*/


            /*new PDFHelper().createPdf("C:\\Users\\Uday\\Desktop\\lambdaPOC\\test.pdf", htmlString);*/

            oOut.close();
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
