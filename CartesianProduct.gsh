/*body A,B,C separated by new line
A
B
C
property 1,2,3 separated by new line
1
2
3

output
A1,A2,A3,B1,B2,B3,C1,C2,C3 separated in new line

*/

import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;

def Message processData(Message message) {
 
	def projectSetBody = message.getBody(String);
   
	def map = message.getProperties();
	def empPayload = map.get("Employee_Payload");
		
	def empLines = empPayload.split("\r\n");
    def projectSetLines = projectSetBody.split("\r\n");
    
   def p1_x_p2 = cartesianProduct(empLines,projectSetLines).collect{"PSP - Employee ID,PSP - Employee ID,${it[0]},${it[1]}"}.join("\n")
   message.setBody(p1_x_p2);
   return message;
}

def cartesianProduct(A, B) {
  A.collectMany{a->B.collect{b->[a, b]}}
}