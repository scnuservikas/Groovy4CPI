/*
{
	"Sender": "S4HC",
	"SenderEnvironment": "Stage",
	"Identifier": "AGEbtp-O5Ig4hcT-xYMlpIXqeqLt",
	"Version": "1.1",
	"Engagements": [
		{
			"Engagement": {
				"ConfidentialFlag": "false",
				"RestrictTimePostingFlag": "false",
				"ChargeCode": {
					"ChargeCodeTypeId": "0"
				}
			},
			"Engagement": {
				"ConfidentialFlag": "false",
				"RestrictTimePostingFlag": "false"
				
			}
		}
	]
}
*/
//Input Json above

import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import groovy.json.*
def Message processData(Message message) {
    
    //Body 
    def body = message.getBody(String.class);
    
    def jsonSlurper = new JsonSlurper()
    def list = jsonSlurper.parseText(body)
    
     
    list.Engagements.Engagement.each{
		it.ConfidentialFlag =  Boolean.parseBoolean(it.get("ConfidentialFlag"));	   
		it.RestrictTimePostingFlag  =  Boolean.parseBoolean(it.get("RestrictTimePostingFlag"));
		
            if(it.ChargeCode != null)
            {
                it.ChargeCode.ChargeCodeTypeId = Integer.parseInt(it.get("ChargeCodeTypeId").get("ChargeCodeTypeId").toString() );
            }
                              
    }
	
 
    def jsonOP = JsonOutput.toJson(list)

    message.setBody(jsonOP);
    return message;
}