/*

Vikas is from India'
He loves travel'

I want to change the above to

Vikas is from India'
He is a boy'
He loves travel'
*/

import com.sap.gateway.ip.core.customdev.util.Message;
def Message processData(Message message) {
		  
    def body = message.getBody(String.class)
	body = body.replaceAll("Vikas.*?'","Vikas is from India'"+"\n"+"He is a boy'");	   //.*?'" this makes the regex select till the first ' not the last, so makes it less greedy
    message.setBody(body);
	return message
}