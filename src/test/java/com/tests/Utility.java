package com.tests;

import net.datafaker.Faker;

public class Utility {
	
	static Faker faker = new Faker();

	public static String generateFullName()
	{
		String fullName = faker.name().fullName();
		return fullName;
	}

	public static String generateFullNameWithParameter(String lastName)
	{
		String firstName = faker.name().firstName();
		return firstName + " " + lastName;
	}

	public String generateEmailAddress()
	{
		String emailAddress = faker.internet().emailAddress();
		return emailAddress;
	}

	public String generateEmailAddressWithParameter(String name)
	{
		String emailAddress = faker.internet().emailAddress();
		return emailAddress + "-" + name;
	}
	public static String generateName(String name) {
		return name;
	}
	
	public String generateFirstName(String name) {
		return name;
	}
}
