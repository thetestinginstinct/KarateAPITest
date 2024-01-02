package com.tests;

import com.intuit.karate.junit5.Karate;

public class SampleTest {
	@Karate.Test
	Karate testSample() {
		return Karate.run("QueryAndPathParameter").relativeTo(getClass());
	}
}
