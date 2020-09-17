package com.enkashpoc.lambdapoc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.HashMap;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class APIRequest
{
    private HashMap<String, String> params;
    private String templateName;
}
