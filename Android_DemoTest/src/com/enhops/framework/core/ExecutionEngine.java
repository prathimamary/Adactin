package com.enhops.framework.core;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.BrowserType;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import com.sun.jna.Platform;

public class ExecutionEngine {
	
	private static WebDriver driver;
	
	public static WebDriver getSeleniumWebDriver()
	{
		if (driver == null)
		{
			
		}
		return driver;
	}
	
	public static WebDriver CreateSeleniumWebDriver() throws InterruptedException
	{
		String browser = "ANDROID";

		
		if (driver!=null)
			return driver;
		
		
		 if (browser.equalsIgnoreCase("android")) {
			DesiredCapabilities caps = DesiredCapabilities.android();
			caps.setCapability(CapabilityType.BROWSER_NAME, BrowserType.ANDROID);
			caps.setCapability("platformName", "Android");
			caps.setCapability(CapabilityType.PLATFORM, Platform.ANDROID);
			caps.setCapability("deviceName", "Google Nexus7");
			caps.setCapability(CapabilityType.VERSION, "6.0");
			caps.setCapability("app", "Browser");
			caps.setCapability("newCommandTimeout", 10000);
			
			URL remoteAddress;
			try {	
				remoteAddress = new URL("http://127.0.0.1:4723/wd/hub");
				driver = new RemoteWebDriver (remoteAddress, caps) ;
               driver.manage().timeouts().implicitlyWait(80, TimeUnit.SECONDS);
				 
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		((JavascriptExecutor) driver).executeScript("window.focus();");
		return driver;
			
	}
	
	
}
