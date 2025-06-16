package ru.bsuedu.cad.lab.conf;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.hibernate.cfg.Environment;
import java.util.Properties;
import javax.sql.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.thymeleaf.spring6.SpringTemplateEngine;
import org.thymeleaf.spring6.view.ThymeleafViewResolver;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import jakarta.persistence.EntityManagerFactory;

@Configuration
@ComponentScan(basePackages = "ru.bsuedu.cad.lab")
@PropertySource("classpath:db/jdbc.properties")
@EnableJpaRepositories(basePackages = "ru.bsuedu.cad.lab.repository")
@EnableTransactionManagement
@EnableWebMvc
public class SpringConfig {

	private static Logger LOGGER = LoggerFactory.getLogger(SpringConfig.class);

	@Value("${jdbc.driverClassName}")
	private String driverClassName;

	@Value("${jdbc.url}")
	private String url;

	@Value("${jdbc.username}")
	private String username;

	@Value("${jdbc.password}")
	private String password;

	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		try {
			var hc = new HikariConfig();
			hc.setJdbcUrl(url);
			hc.setDriverClassName(driverClassName);
			hc.setUsername(username);
			hc.setPassword(password);
			var dataSource = new HikariDataSource(hc);
			dataSource.setMaximumPoolSize(25);
			return dataSource;
		} catch (Exception e) {
			LOGGER.error("Hikari DataSource bean cannot be created!", e);
			return null;

		}
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(dataSource());
		em.setPackagesToScan("ru.bsuedu.cad.lab.entity");

		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		vendorAdapter.setShowSql(true);
		vendorAdapter.setGenerateDdl(true);
		vendorAdapter.setDatabasePlatform("org.hibernate.dialect.H2Dialect");
		em.setJpaVendorAdapter(vendorAdapter);

		Properties properties = new Properties();
		properties.put(Environment.HBM2DDL_AUTO, "create-drop");
		properties.put(Environment.DIALECT, "org.hibernate.dialect.H2Dialect");
		properties.put(Environment.FORMAT_SQL, true);
		properties.put(Environment.USE_SQL_COMMENTS, false);
		properties.put(Environment.SHOW_SQL, true);
		properties.put(Environment.MAX_FETCH_DEPTH, 3);
		properties.put(Environment.STATEMENT_BATCH_SIZE, 10);
		properties.put(Environment.STATEMENT_FETCH_SIZE, 50);
		properties.put(Environment.HBM2DDL_IMPORT_FILES, "import.sql");
		em.setJpaProperties(properties);

		return em;
	}

	@Bean
	public PlatformTransactionManager transactionManager(
			@Autowired EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory);
		return transactionManager;
	}

	@Bean
	public ClassLoaderTemplateResolver templateResolver() {
		ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
		resolver.setPrefix("templates/");
		resolver.setSuffix(".html");
		resolver.setTemplateMode(TemplateMode.HTML);
		resolver.setCharacterEncoding("UTF-8");
		resolver.setCacheable(false);
		return resolver;
	}

	@Bean
	public SpringTemplateEngine templateEngine() {
		SpringTemplateEngine engine = new SpringTemplateEngine();
		engine.setTemplateResolver(templateResolver());
		return engine;
	}

	@Bean
	public ViewResolver viewResolver() {
		ThymeleafViewResolver resolver = new ThymeleafViewResolver();
		resolver.setTemplateEngine(templateEngine());
		resolver.setCharacterEncoding("UTF-8");
		return resolver;
	}
}
