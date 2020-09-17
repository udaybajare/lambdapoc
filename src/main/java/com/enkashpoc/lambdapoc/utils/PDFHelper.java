package com.enkashpoc.lambdapoc.utils;

import com.enkashpoc.lambdapoc.Constant;
import com.itextpdf.html2pdf.HtmlConverter;

import java.io.*;
import java.time.LocalTime;

public class PDFHelper
{
    public String generateAndUploadPDF(ByteArrayOutputStream oOut, String htmlString) throws IOException {

        HtmlConverter.convertToPdf(htmlString, oOut);

        String fileName = Constant.OUTPUT_FILE_PREFIX + LocalTime.now().toString().replace(":", "_").replace(".", "_") + ".pdf";

        //Need to store a temporary file on "/tmp" location as this is the only location accessible for lambda
        File fileToUpload = new File("/tmp/" + fileName);

        FileOutputStream fOut = new FileOutputStream(fileToUpload);
        fOut.write(oOut.toByteArray());
        fOut.close();

        AWSS3Helper awsS3Helper = new AWSS3Helper();

        String generatedFileLink = awsS3Helper.uploadPDFToS3(fileName, fileToUpload);

        fileToUpload.delete();

        return generatedFileLink;
    }

}