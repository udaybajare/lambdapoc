package com.enkashpoc.lambdapoc.utils;

import com.enkashpoc.lambdapoc.model.APIRequest;
import com.enkashpoc.lambdapoc.template.S3TemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URL;

public class FreemarkerHelper {

    static Configuration freemarkerConfig = new Configuration(Configuration.VERSION_2_3_30);

    static {
        freemarkerConfig.setLocalizedLookup(false);
        try {
            freemarkerConfig.setTemplateLoader(new S3TemplateLoader(new URL(System.getenv("S3_TEMPLATE_URL"))));
        } catch (Exception ex) {
            // Need to handle this exception
            //If S3 bucket access call fails we can load templates from back Up location
            // freemarkerConfig.setTemplateLoader(new S3TemplateLoader(new URL({BACK_UP_TEMPLATE_LOCATION})));
        }

        freemarkerConfig.setDefaultEncoding("UTF-8");
        freemarkerConfig.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
    }

    public String getTemplateString(APIRequest apiRequest) throws IOException, TemplateException {
        String htmlString = "";
        Writer stringWriter = new StringWriter();

        Template template = freemarkerConfig.getTemplate(apiRequest.getTemplateName() + ".ftl");

        template.process(apiRequest.getParams(), stringWriter);

        htmlString = stringWriter.toString();

        stringWriter.close();
        return htmlString;
    }
}
