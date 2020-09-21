package com.enkashpoc.lambdapoc.utils;

import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import java.io.File;

public class AWSS3Helper {
    public String uploadPDFToS3(String fileObjKeyName, File fileToUpload) {

        AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
                .withRegion(Regions.US_EAST_1)
                .build();

        PutObjectRequest request = new PutObjectRequest(System.getenv("S3_BUCKET_GENERATED_PDF"), fileObjKeyName, fileToUpload);
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentType("application/pdf");
        request.setMetadata(metadata);

        s3Client.putObject(request.withCannedAcl(CannedAccessControlList.PublicRead));

        return s3Client.getUrl(System.getenv("S3_BUCKET_GENERATED_PDF"), fileObjKeyName).toExternalForm().replace(" ", "");
   }

}
