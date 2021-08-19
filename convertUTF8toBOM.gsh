def Message processData(Message message) {
            
        def body = message.getBody(java.lang.String) as String;
       
        String charset = "utf-8";
        byte[] BOM = [0xEF,0xBB,0xBF];
        
        String byteordermark = new String (BOM, charset); 
        String output = new String(BOM,charset) + s1;
        
        message.setBody(output);
		return message;

}