package com.enhops.scripts;
import org.testng.annotations.Test;
import org.openqa.selenium.support.PageFactory;

import com.enhops.framework.core.BaseTest;
import com.enhops.framework.core.ExecutionEngine;
import com.enhops.pageobjectfactory.Adactin.Login;

public class AdactinLoginTest extends BaseTest

{
	@Test
	public void Adactin_User_Login()
	{
		Login Adactin_Login = PageFactory.initElements(ExecutionEngine.getSeleniumWebDriver(), Login.class);
		Adactin_Login.LoginToAdactin();
	}		
	
}


	
