package com.enhops.pageobjectfactory.Adactin;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;



public class Login {

	@FindBy(id = "username")
	public WebElement txt_username;
	
	@FindBy(id = "password")
	public WebElement txt_password;
	
	@FindBy(id = "login")
	public WebElement btn_login;
	
	
	public void LoginToAdactin()
	{
		txt_username.click();	
		txt_username.sendKeys("EIN00200"); 
		txt_password.sendKeys("enhops@123");
	    btn_login.click();
		
	
	}
}