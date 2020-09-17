package com.enkashpoc.lambdapoc;
public class Constant
{

    public static final String S3_BUCKET_FREEMARKER_TEMPLATE = "";
    public static final String S3_BUCKET_GENERATED_PDF = "pdfcontainerenkash";
    public static final String S3_TEMPLATE_URL = "https://psdtemplates.s3.amazonaws.com/";
    public static final String OUTPUT_FILE_PREFIX = "GeneratedPdf";

    public static final String ERROR_MESSAGE_GENERIC = "Error occurred while generating PDF. Please verify the input and try again.";
    public static final String ERROR_PARSING_JSON = "Error occurred while parsing input JSON. Please try with valid json format.";
    public static final String ERROR_MISSING_PARAM = "One or more input parameters are missing. Pleaser try with complete parameter values";
    public static final String ERROR_ACCESSING_S3 = "Error accessing template from S3. Please try after some time.";

}
