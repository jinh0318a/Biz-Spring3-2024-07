package com.callor.rentalbook.listeners;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class SessionInitializer implements HttpSessionListener{
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		se.getSession().setAttribute("auth", false);
	}
}
