package com.enhops.framework.core;

import java.util.concurrent.TimeUnit;

import org.testng.ITestContext;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeSuite;

//import com.enhops.framework.testreports.ReportManager;
public class BaseTest {
	
	
	public static void ClassInit()
	{
		
	}
	
	public static void ClassCleanup()
	{
		
	}
	
	@BeforeMethod
	public void testInit(ITestContext context)
	{
		//ReportManager.initalizeTestCase(context.getName(), context.getName());
	}
	
	@BeforeSuite
	public void SuiteInit(ITestContext context) throws InterruptedException 
	{
		ExecutionEngine.CreateSeleniumWebDriver();
		ExecutionEngine.getSeleniumWebDriver().navigate().to("http://adactin.com/HotelApp/");
		ExecutionEngine.getSeleniumWebDriver().manage().timeouts().implicitlyWait(80, TimeUnit.SECONDS);
		
	}
	
	@AfterSuite
	public void SuiteCleanup(ITestContext context) 
	{
		ExecutionEngine.getSeleniumWebDriver().quit();
		///ReportManager.SaveTestReport();
	}
	@AfterMethod
	public void testCleanup()
	{
		//ReportManager.ClostTestCaseReport();
	}

}