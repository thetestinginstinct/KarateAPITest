package com.tests;

import static org.junit.jupiter.api.Assertions.assertEquals;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
public class TestParallel {
	
	@Test
	void testParallel() {
		Results results = Runner.path("classpath:com/tests/Tags.feature")
				// uncomment the below line to use tags
				// .tags("smoke")
				// uncomment the below line to switch environment value
				// .karateEnv("stage")
				// uncomment the below line to use dry run
				// .dryRun(true)
				.parallel(4);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}
}
