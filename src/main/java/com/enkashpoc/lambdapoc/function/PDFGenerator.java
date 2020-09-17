package com.enkashpoc.lambdapoc.function;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
import com.enkashpoc.lambdapoc.Constant;
import com.enkashpoc.lambdapoc.model.APIRequest;
import com.enkashpoc.lambdapoc.utils.FreemarkerHelper;
import com.enkashpoc.lambdapoc.utils.PDFHelper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import freemarker.core.InvalidReferenceException;
import freemarker.template.TemplateException;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class PDFGenerator implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {

    @Override
    public APIGatewayProxyResponseEvent handleRequest(APIGatewayProxyRequestEvent inputRequest, Context context) {

        APIGatewayProxyResponseEvent responseEvent = new APIGatewayProxyResponseEvent();
        ByteArrayOutputStream oOut = new ByteArrayOutputStream();

        LambdaLogger logger = context.getLogger();

        try {

            APIRequest apiRequest = mapRequest(inputRequest);

            String htmlString = new FreemarkerHelper().getTemplateString(apiRequest);

            String generatedFileLink = new PDFHelper().generateAndUploadPDF(oOut, htmlString);

            oOut.close();

            responseEvent.setBody(generatedFileLink);
            responseEvent.setStatusCode(200);

        } catch (JsonProcessingException jsonProcessingException) {
            responseEvent.setStatusCode(500);
            responseEvent.setBody(Constant.ERROR_PARSING_JSON);
            logger.log(jsonProcessingException.getLocalizedMessage());
        } catch (InvalidReferenceException missingParamEx) {
            responseEvent.setStatusCode(500);
            responseEvent.setBody(Constant.ERROR_MISSING_PARAM);
            logger.log(missingParamEx.getLocalizedMessage());
        } catch (IOException | TemplateException templateEx) {
            responseEvent.setStatusCode(500);
            responseEvent.setBody(Constant.ERROR_ACCESSING_S3);
            logger.log(templateEx.getLocalizedMessage());
        } catch (AmazonServiceException awsEx) {
            responseEvent.setStatusCode(500);
            responseEvent.setBody(Constant.ERROR_ACCESSING_S3);
            logger.log(awsEx.getLocalizedMessage());
        } catch (Exception ex) {
            responseEvent.setStatusCode(500);
            responseEvent.setBody(Constant.ERROR_MESSAGE_GENERIC);
            logger.log(ex.getLocalizedMessage());
        } finally {
            try {
                oOut.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return responseEvent;
    }

    APIRequest mapRequest(APIGatewayProxyRequestEvent inputRequest) throws JsonProcessingException {
        APIRequest apiRequest = null;

        String jsonString = new String(Base64.getDecoder().decode(inputRequest.getBody()));

        ObjectMapper mapper = new ObjectMapper();

        apiRequest = mapper.readValue(jsonString, APIRequest.class);

        return apiRequest;
    }
}
