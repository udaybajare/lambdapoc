package com.enkashpoc.lambdapoc.template;

import freemarker.cache.URLTemplateLoader;

import java.net.MalformedURLException;
import java.net.URL;

public class S3TemplateLoader extends URLTemplateLoader
{
    private URL root;

    public S3TemplateLoader(URL root) {
        super();
        this.root = root;
    }

    @Override
    protected URL getURL(String template) {
        try {
            URL tu = new URL(root,  "./" + template);
            return tu;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
