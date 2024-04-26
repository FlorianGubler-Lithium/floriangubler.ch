package ch.floriangubler.floriangublerch;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;

@SpringBootApplication
@EnableAutoConfiguration
public class FloriangublerChApplication {

	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(FloriangublerChApplication.class);
		app.setApplicationStartup(new BufferingApplicationStartup(2048));
		app.run(args);
	}

}
