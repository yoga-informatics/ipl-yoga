package lsp;

import java.util.Date;

public class Smartphone extends Product {
    @Override 
    String getName() {
        return "Samsung S10+ Limited Edition"; 
    } 
    
    @Override 
    Date getExpiredDate() { 
        return new Date(); 
    } 
}    

