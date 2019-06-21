package com.abid.jquerydatatable;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * @author imssbora
 */

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.abid" })
public class WebConfig implements WebMvcConfigurer {
	
   
   @Bean
   public ViewResolver getViewResolver() {
       InternalResourceViewResolver resolver = new InternalResourceViewResolver();
       resolver.setPrefix("/WEB-INF/pages/");
       resolver.setSuffix(".jsp");
       return resolver;
   }
   
   
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
       registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/");
       registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/");
       registry.addResourceHandler("/images/**").addResourceLocations("classpath:/static/images/");

   }
   
   
   @Override
   public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
       configurer.enable();
   }
   

}
